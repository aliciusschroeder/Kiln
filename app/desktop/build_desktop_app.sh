#!/usr/bin/env bash

set -e

# move to the /app directory of the project
cd "$(dirname "$0")"
cd ..
APP_DIR=$PWD

if [[ $* != *--skip-web* ]]; then
  # build the web ui
  echo "Building web UI"
  cd web_ui
  npm install
  npm run build
  cd $APP_DIR
fi

# Building the bootloader ourselves helps not be falsely detected as malware by antivirus software on windows.
# We clone pyinstaller, build the bootloader, and install it into the pyproject desktop pyproject.
if [[ $* == *--build-bootloader* ]]; then
  echo "Building pyinstaller inlucding bootloader"

  mkdir -p desktop/build/bootloader
  cd desktop/build/bootloader
  curl -L https://github.com/pyinstaller/pyinstaller/archive/refs/tags/v6.11.1.tar.gz -o pyinstaller.tar.gz
  tar -xzf pyinstaller.tar.gz
  mv pyinstaller-6.11.1 pyinstaller
  cd pyinstaller/bootloader
  python ./waf all

  # install the pyinstaller we just built into the desktop pyproject
  cd $APP_DIR/desktop
  uv add build/bootloader/pyinstaller

  # return to the /app directory of the project
  cd $APP_DIR
fi

mkdir -p desktop/build

echo "Building for $(uname)"
if [ "$(uname)" == "Darwin" ]; then
  echo "Building MacOS app"
  cp desktop/mac_taskbar.png desktop/build/taskbar.png
  # onedir launches faster, and still looks like 1 file with MacOS .app bundles
  PLATFORM_OPTS="--onedir --windowed --icon=../mac_icon.png --osx-bundle-identifier=com.kiln-ai.kiln.studio"

  PY_PLAT=$(python -c 'import platform; print(platform.machine())')
  echo "Building MacOS app for single platform ($PY_PLAT)"
elif [[ "$(uname)" =~ ^MINGW64_NT-10.0 ]] || [[ "$(uname)" =~ ^MSYS_NT-10.0 ]]; then
  echo "Building Windows App"
  cp desktop/win_taskbar.png desktop/build/taskbar.png
  PLATFORM_OPTS="--windowed --splash=../win_splash.png --icon=../win_icon.ico"
elif [ "$(uname)" == "Linux" ]; then
  echo "Building Linux App"
  cp desktop/mac_taskbar.png desktop/build/taskbar.png
  PLATFORM_OPTS="--windowed --onefile --splash=../win_splash.png --icon=../mac_icon.png"
else
  echo "Unsupported operating system: $(uname)"
  exit 1
fi

# Builds the desktop app
# TODO: use a spec instead of long winded command line
pyinstaller $(printf %s "$PLATFORM_OPTS")  \
  --add-data "./taskbar.png:." --add-data "../../web_ui/build:./web_ui/build" \
  --noconfirm --distpath=./desktop/build/dist --workpath=./desktop/build/work \
  -n Kiln --specpath=./desktop/build \
  --hidden-import=tkinter \
  --hidden-import=PIL.ImageTk \
  --hidden-import=tiktoken_ext.openai_public \
  --hidden-import=tiktoken_ext \
  --hidden-import=litellm \
  --collect-all=litellm \
  --paths=. ./desktop/desktop.py

if [ "$(uname)" == "Linux" ]; then
  echo "Creating AppImage"
  cd $APP_DIR/desktop/appimage
  # Patch packaging to handle ubuntu version strings
  grep -q '^[ ]\{8\}version = version.split("ubuntu")' ../../../.venv/lib/python3.13/site-packages/packaging/version.py || sed -i '/^[ ]\{8\}match = self\._regex\.search(version)/i\        version = version.split("ubuntu")[0]' ../../../.venv/lib/python3.13/site-packages/packaging/version.py
  # Switch to latest AppImage runtime (https://github.com/AppImageCrafters/appimage-builder/issues/364)
  f=../../../.venv/lib/python3.13/site-packages/appimagebuilder/modules/appimage.py; [ -f "$f" ] && sed -i 's|https://github.com/AppImage/AppImageKit/releases/download/continuous/runtime-%s|https://github.com/AppImage/type2-runtime/releases/tag/continuous/runtime-%s|' "$f"
  uv run appimage-builder --recipe AppImageBuilder.yml --skip-tests
fi
