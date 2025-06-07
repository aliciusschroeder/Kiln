---
milestone_id: M01
name: Linux AppImage Support
status: IN_PROGRESS
start_date: 2025-06-07
target_date: 2025-06-08
actual_date: null
description: Implement AppImage packaging for Linux distribution of Kiln AI desktop application
---

# Milestone M01: Linux AppImage Support

## Overview

This milestone focuses on implementing AppImage packaging for the Linux distribution of Kiln AI's desktop application. Currently, Kiln uses PyInstaller to create a single executable file for Linux, but AppImage provides better compatibility, portability, and desktop integration across different Linux distributions.

## Success Criteria

1. ✅ Linux build process modified to use `--onedir` instead of `--onefile`
2. ✅ AppImage-builder recipe created and tested
3. ✅ Build script extended to support AppImage generation
4. ✅ CI/CD pipeline updated to automatically build AppImages
5. ✅ AppImage tested on multiple Linux distributions
6. ✅ Desktop integration working (menu entries, icons)
7. ✅ SSL certificates properly bundled for API calls

## Technical Scope

### Required Changes

- Modify PyInstaller configuration for Linux builds
- Create appimage-builder recipe configuration
- Update build_desktop_app.sh script
- Implement CI/CD workflow changes
- Test on Ubuntu, Fedora, and Arch-based distributions

### Dependencies

- PyInstaller (existing)
- appimage-builder (new dependency)
- GitHub Actions for CI/CD

## Risks & Mitigations

1. **Risk**: Path resolution issues in AppImage environment

   - **Mitigation**: Careful testing of file paths and resource loading

2. **Risk**: SSL certificate bundling complications

   - **Mitigation**: Follow PyQt5 AppImage example for certificate handling

3. **Risk**: Desktop integration inconsistencies across distributions
   - **Mitigation**: Test on major distribution families early

## Resources

- Task definition: contributing/task-linux-appimage-support.md
- Current build script: app/desktop/build_desktop_app.sh
- PyInstaller docs: Focus on "Bundling to One Folder"
- AppImage-builder docs: PyQt5 example as reference
