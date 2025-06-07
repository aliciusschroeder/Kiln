# Requirement R01: Research and Documentation

## Description
Complete research on AppImage-builder and PyInstaller to understand the necessary changes for implementing AppImage support for Kiln's Linux distribution.

## Acceptance Criteria

1. **AppImage-builder Knowledge**
   - [ ] Read and understand PyQt5 application example (most relevant to Kiln)
   - [ ] Review Recipe Reference for configuration options
   - [ ] Study Flutter Application example for CI/CD patterns
   - [ ] Understand Troubleshooting guide for debugging

2. **PyInstaller Adjustments**
   - [ ] Understand "Bundling to One Folder" (`--onedir`) requirements
   - [ ] Review Linux-specific platform notes
   - [ ] Document path resolution considerations for AppImage
   - [ ] Identify changes needed in current build process

3. **Documentation Output**
   - [ ] Create technical notes on AppImage integration approach
   - [ ] Document potential issues and solutions
   - [ ] Outline step-by-step implementation plan

## Technical Details

### Current State
- Kiln uses PyInstaller with `--onefile` for Linux builds
- Creates single executable at `dist/kiln`
- Build script: `app/desktop/build_desktop_app.sh`

### Target State
- Use PyInstaller with `--onedir` for AppImage compatibility
- Package resulting directory with appimage-builder
- Maintain desktop integration and SSL certificate support

## References
- PyQt5 AppImage example (primary reference)
- appimage-builder Recipe Reference
- PyInstaller "Bundling to One Folder" documentation
- Current task outline: `contributing/task-linux-appimage-support.md`