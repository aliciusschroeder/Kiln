# Requirement R02: Modify Linux Build Process

## Description
Update the PyInstaller build configuration for Linux to use `--onedir` instead of `--onefile`, preparing the output for AppImage packaging.

## Acceptance Criteria

1. **PyInstaller Configuration**
   - [ ] Modify Linux build to use `--onedir` flag
   - [ ] Ensure all dependencies are properly included
   - [ ] Verify resource files are correctly bundled
   - [ ] Test path resolution works in directory structure

2. **Build Script Updates**
   - [ ] Update `build_desktop_app.sh` for Linux platform
   - [ ] Maintain backward compatibility flags if needed
   - [ ] Add AppImage-specific build options
   - [ ] Preserve existing Windows/macOS functionality

3. **Testing**
   - [ ] Verify `--onedir` build completes successfully
   - [ ] Test application launches from directory structure
   - [ ] Ensure all features work (system tray, web UI, etc.)
   - [ ] Validate SSL certificates load properly

## Technical Details

### Current Implementation
```bash
# Current Linux build in build_desktop_app.sh
pyinstaller \
    --name=kiln \
    --onefile \
    --windowed \
    --distpath dist \
    # ... other flags
```

### Required Changes
```bash
# New Linux build for AppImage
pyinstaller \
    --name=kiln \
    --onedir \        # Changed from --onefile
    --windowed \
    --distpath dist \
    # ... other flags
```

### Considerations
- Output will be in `dist/kiln/` directory instead of single file
- May need to adjust hidden imports
- Icon and resource handling might need updates
- Path resolution in application code may require changes

## Dependencies
- R01 (Research) must be completed first
- Existing PyInstaller setup
- Linux development environment for testing