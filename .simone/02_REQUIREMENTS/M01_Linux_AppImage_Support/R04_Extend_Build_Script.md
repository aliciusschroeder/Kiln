# Requirement R04: Extend Build Script

## Description
Enhance the existing `build_desktop_app.sh` script to support AppImage generation as part of the Linux build process.

## Acceptance Criteria

1. **Script Enhancement**
   - [ ] Add AppImage build option/flag (e.g., `--appimage`)
   - [ ] Integrate appimage-builder into build workflow
   - [ ] Maintain existing build functionality
   - [ ] Add proper error handling for AppImage steps

2. **AppImage Integration**
   - [ ] Install/check for appimage-builder dependency
   - [ ] Copy recipe file to build directory
   - [ ] Execute appimage-builder after PyInstaller
   - [ ] Handle output file naming and location

3. **Build Options**
   - [ ] Support both traditional and AppImage builds
   - [ ] Allow version override for AppImage metadata
   - [ ] Enable debug/verbose output for troubleshooting
   - [ ] Preserve build artifacts for debugging

4. **Documentation**
   - [ ] Update script help/usage information
   - [ ] Add comments explaining AppImage steps
   - [ ] Document new command-line options
   - [ ] Update desktop README if needed

## Technical Details

### Current Script Structure
```bash
# app/desktop/build_desktop_app.sh currently:
1. Sets up environment variables
2. Builds web UI (optional)
3. Runs PyInstaller
4. Platform-specific packaging (DMG for macOS)
```

### Proposed Changes
```bash
# New AppImage workflow addition:
if [[ "$BUILD_APPIMAGE" == "true" ]]; then
    # Check for appimage-builder
    # Copy recipe to build directory
    # Run appimage-builder
    # Move resulting AppImage to final location
fi
```

### Integration Points
- After PyInstaller `--onedir` build completes
- Before final artifact cleanup
- Use existing version detection logic
- Leverage current platform detection

## Dependencies
- R02 (Linux build modification) must be completed
- R03 (AppImage recipe) must be available
- appimage-builder must be installable in CI environment