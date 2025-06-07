From 85fe0c15b6ef7dcb8f66cc8b46e02ad5bdf93e27 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Micka=C3=ABl=20Schoentgen?= <contact@tiger-222.fr>
Date: Tue, 6 Oct 2020 11:20:38 +0200
Subject: [PATCH] Tests: Add an AppImage regression test

---
 .travis.yml                                   |  7 +++
 tests/functional/data/appimage/AppIcon.svg    |  1 +
 tests/functional/data/appimage/DirIcon.png    |  1 +
 tests/functional/data/appimage/create.sh      | 31 ++++++++++
 .../org.pyinstaller.appimage.test.appdata.xml | 19 ++++++
 .../org.pyinstaller.appimage.test.desktop     | 10 ++++
 tests/functional/test_linux_appimage.py       | 60 +++++++++++++++++++
 7 files changed, 129 insertions(+)
 create mode 120000 tests/functional/data/appimage/AppIcon.svg
 create mode 120000 tests/functional/data/appimage/DirIcon.png
 create mode 100644 tests/functional/data/appimage/create.sh
 create mode 100644 tests/functional/data/appimage/org.pyinstaller.appimage.test.appdata.xml
 create mode 100644 tests/functional/data/appimage/org.pyinstaller.appimage.test.desktop
 create mode 100644 tests/functional/test_linux_appimage.py

diff --git a/.travis.yml b/.travis.yml
index 614a3565cc..2607bab89d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -36,6 +36,13 @@ jobs:
     - &test-pyinstaller
       stage: Test - PyInstaller
       python: 3.7
+      before_install:
+        # Download the appimagetool binary for AppImage-specific tests
+        - >
+            wget
+            https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage
+            -O $HOME/appimagetool-x86_64.AppImage
+        - chmod a+x $HOME/appimagetool-x86_64.AppImage
       script:
         # -n 3
         #   Run tests and speed them up by sending them to multiple CPUs.
diff --git a/tests/functional/data/appimage/AppIcon.svg b/tests/functional/data/appimage/AppIcon.svg
new file mode 120000
index 0000000000..9f42050c9f
--- /dev/null
+++ b/tests/functional/data/appimage/AppIcon.svg
@@ -0,0 +1 @@
+../../../../PyInstaller/bootloader/images/icon-windowed.svg
\ No newline at end of file
diff --git a/tests/functional/data/appimage/DirIcon.png b/tests/functional/data/appimage/DirIcon.png
new file mode 120000
index 0000000000..fc02923ae2
--- /dev/null
+++ b/tests/functional/data/appimage/DirIcon.png
@@ -0,0 +1 @@
+../../../../PyInstaller/bootloader/images/github_logo.png
\ No newline at end of file
diff --git a/tests/functional/data/appimage/create.sh b/tests/functional/data/appimage/create.sh
new file mode 100644
index 0000000000..7380748655
--- /dev/null
+++ b/tests/functional/data/appimage/create.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+set -e
+
+main() {
+    local tools_dir="$1"
+    local tmp_dir="$2"
+    local app_name="$3"
+    local app_id="org.pyinstaller.appimage.test"
+    local app_dir="${tmp_dir}/dist/AppRun"
+
+    echo ">>> Adjusting file names to fit in the AppImage"
+    [ -d "${app_dir}" ] && rm -rf "${app_dir}"
+    mv -v "${tmp_dir}/dist/${app_name}" "${app_dir}"
+    mv -v "${app_dir}/${app_name}" "${app_dir}/AppRun"
+
+    echo ">>> Copying icons"
+    cp -v "${tools_dir}/DirIcon.png" "${app_dir}/.DirIcon"
+    cp -v "${tools_dir}/AppIcon.svg" "${app_dir}/${app_name}.svg"
+
+    echo ">>> Copying metadata files"
+    mkdir -pv "${app_dir}/usr/share/metainfo"
+    cp -v "${tools_dir}/${app_id}.appdata.xml" "${app_dir}/usr/share/metainfo"
+    mkdir -pv "${app_dir}/usr/share/applications"
+    cp -v "${tools_dir}/${app_id}.desktop" "${app_dir}/usr/share/applications"
+    ln -srv "${app_dir}/usr/share/applications/${app_id}.desktop" "${app_dir}/${app_id}.desktop"
+
+    return 0  # <-- Needed, do not remove!
+}
+
+main "$@"
diff --git a/tests/functional/data/appimage/org.pyinstaller.appimage.test.appdata.xml b/tests/functional/data/appimage/org.pyinstaller.appimage.test.appdata.xml
new file mode 100644
index 0000000000..1c47f4d672
--- /dev/null
+++ b/tests/functional/data/appimage/org.pyinstaller.appimage.test.appdata.xml
@@ -0,0 +1,19 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<component type="desktop-application">
+	<id>org.pyinstaller.appimage.test</id>
+	<metadata_license>MIT</metadata_license>
+	<project_license>LGPL-2.1-only</project_license>
+	<name>PyInstaller Appimage Test</name>
+	<summary>Some summary</summary>
+	<description>
+		<p>Simple AppImage test for code frozen with PyInstaller.</p>
+	</description>
+	<launchable type="desktop-id">org.pyinstaller.appimage.test</launchable>
+	<url type="homepage">https://github.com/pyinstaller/pyinstaller</url>
+	<url type="bugtracker">https://github.com/pyinstaller/pyinstaller/issues</url>
+	<developer_name>PyInstaller</developer_name>
+	<update_contact>contact -- example dot org</update_contact>
+	<provides>
+		<binary>apptest</binary>
+	</provides>
+</component>
diff --git a/tests/functional/data/appimage/org.pyinstaller.appimage.test.desktop b/tests/functional/data/appimage/org.pyinstaller.appimage.test.desktop
new file mode 100644
index 0000000000..b4f5f0da6b
--- /dev/null
+++ b/tests/functional/data/appimage/org.pyinstaller.appimage.test.desktop
@@ -0,0 +1,10 @@
+[Desktop Entry]
+Name=PyInstaller Appimage Test
+GenericName=PyInstaller Appimage Test
+Comment=Simple AppImage test for code frozen with PyInstaller.
+Exec=false
+Icon=apptest
+Type=Application
+StartupNotify=false
+Terminal=false
+Categories=Office;
diff --git a/tests/functional/test_linux_appimage.py b/tests/functional/test_linux_appimage.py
new file mode 100644
index 0000000000..98015265a0
--- /dev/null
+++ b/tests/functional/test_linux_appimage.py
@@ -0,0 +1,60 @@
+#-----------------------------------------------------------------------------
+# Copyright (c) 2005-2020, PyInstaller Development Team.
+#
+# Distributed under the terms of the GNU General Public License (version 2
+# or later) with exception for distributing the bootloader.
+#
+# The full license is in the file COPYING.txt, distributed with this software.
+#
+# SPDX-License-Identifier: (GPL-2.0-or-later WITH Bootloader-exception)
+#-----------------------------------------------------------------------------
+
+"""
+GNU/Linux-specific test to check the bootloader from the AppImage.
+"""
+
+# Library imports
+# ---------------
+import os
+import pathlib
+import stat
+import subprocess
+import pytest
+
+
+@pytest.mark.linux
+@pytest.mark.parametrize('arch', ['x86_64'])
+def test_appimage_loading(tmp_path, pyi_builder_spec, arch):
+    # Skip the test if appimagetool is not found
+    appimagetool = pathlib.Path.home() / ('appimagetool-%s.AppImage' % arch)
+    if not os.path.isfile(appimagetool):
+        pytest.skip('%s not found' % appimagetool)
+
+    # Ensure appimagetool is executable
+    if not os.access(appimagetool, os.X_OK):
+        st = os.stat(appimagetool)
+        os.chmod(appimagetool, st.st_mode | stat.S_IXUSR)
+
+    tmp_path = str(tmp_path)  # Fix for Python 3.5
+
+    app_name = 'apptest'
+    app_path = os.path.join(tmp_path, '%s-%s.AppImage' % (app_name, arch))
+
+    # Freeze the app
+    pyi_builder_spec.test_source('print("OK")', app_name=app_name,
+                                 pyi_args=["--onedir"])
+
+    # Prepare the dist folder for AppImage compliancy
+    tools_dir = os.path.join(os.path.dirname(__file__), 'data', 'appimage')
+    script = os.path.join(tools_dir, 'create.sh')
+    subprocess.check_call(['bash', script, tools_dir, tmp_path, app_name])
+
+    # Create the AppImage
+    app_dir = os.path.join(tmp_path, 'dist', 'AppRun')
+    subprocess.check_call([appimagetool, "--no-appstream", app_dir,
+                           app_path])
+
+    # Launch the AppImage
+    st = os.stat(app_path)
+    os.chmod(app_path, st.st_mode | stat.S_IXUSR)
+    subprocess.check_call([app_path])
