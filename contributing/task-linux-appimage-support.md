# Goal: Linux app image support

## 1. Inform yourself about AppImage-Builder and PyInstaller

### 1.1 AppImage Documentation to Read

**Essential (Must Read):**

- **PyQt5 application** - This is your closest match. Even though Kiln uses Tkinter not PyQt, it's still a Python GUI app and covers:
  - Python dependency resolution
  - Desktop integration
  - SSL certificates (which Kiln likely needs for API calls)
  - The complete workflow from build to AppImage

**Helpful (Should Read):**

- **Recipe Reference** (Advanced Topics) - Essential for understanding configuration options
- **Flutter Application** - Shows modern CI/CD integration and recipe polishing techniques
- **Troubleshooting** (Advanced Topics) - Will save debugging time

**Nice to Have:**

- **Shell application (BASH)** - For understanding basic AppImage structure
- **Testing** (Advanced Topics) - For CI/CD integration
- **Setup Helpers** (Advanced Topics) - For installation automation

## 1.2 PyInstaller Documentation to Read

**Critical (Must Read):**

- **Bundling to One Folder** - Kiln currently uses `--onefile` for Linux but AppImage requires `--onedir`
- **Platform-specific Notes** - Linux-specific considerations
- **Supporting Multiple Platforms** - Since you're already cross-platform

**Useful (Should Read):**

- **Using Spec Files** - May be needed for more complex AppImage builds
- **When Things Go Wrong** → **Finding out What Went Wrong** - For debugging
- **Run-time Information** → **Using `__file__`** - Important for path resolution in AppImage

**Skip (Already Know):**

- Basic installation/usage docs (they're already using PyInstaller successfully)
- Windows/macOS specific sections
- Most advanced topics

### Recommended Reading Order

1. **appimage-builder PyQt5 example** - Get the full workflow
2. **PyInstaller "Bundling to One Folder"** - Understand the required change
3. **appimage-builder Recipe Reference** - Learn configuration syntax
4. **PyInstaller "Platform-specific Notes"** - Linux gotchas
5. **appimage-builder Troubleshooting** - For when things break

# 2. Modify Linux Build Process

# 3. Extend Build Script

# 4. Update CI/CD

# 5. Create appimage-builder Recipe

---

Additional Notes:

Pyinstaller has some tests as shown in /contributing/task-linux-appimage-support.md
