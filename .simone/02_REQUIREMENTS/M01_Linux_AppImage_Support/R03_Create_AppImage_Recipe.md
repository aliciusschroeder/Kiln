# Requirement R03: Create AppImage Recipe

## Description
Develop an appimage-builder recipe configuration file that properly packages the PyInstaller output into a functional AppImage with desktop integration.

## Acceptance Criteria

1. **Recipe Configuration**
   - [ ] Create `AppImageBuilder.yml` configuration file
   - [ ] Configure application metadata (name, version, icon)
   - [ ] Set up proper file structure mapping
   - [ ] Define runtime dependencies

2. **Desktop Integration**
   - [ ] Create/update `.desktop` file for menu entry
   - [ ] Configure application icon at multiple resolutions
   - [ ] Set up MIME type associations if needed
   - [ ] Ensure proper executable permissions

3. **Dependencies & Runtime**
   - [ ] Bundle necessary system libraries
   - [ ] Configure SSL certificate handling
   - [ ] Set up Python runtime environment
   - [ ] Handle GTK/Qt dependencies for system tray

4. **Testing**
   - [ ] Build AppImage successfully with recipe
   - [ ] Test on clean Linux system
   - [ ] Verify desktop integration works
   - [ ] Ensure all Kiln features function properly

## Technical Details

### Recipe Structure Example
```yaml
version: 1
AppDir:
  path: ./AppDir
  app_info:
    id: ai.getkiln.kiln
    name: Kiln
    icon: kiln
    version: 0.16.0
    exec: kiln/kiln
  
  files:
    include:
      - dist/kiln/**
    exclude: []
  
  runtime:
    env:
      SSL_CERT_FILE: ${APPDIR}/etc/ssl/certs/ca-certificates.crt
```

### Key Considerations
- SSL certificates must be bundled for API calls
- System tray functionality requires proper GTK setup
- File paths need to be relative to AppDir
- Desktop file must follow freedesktop.org standards

## References
- PyQt5 AppImage example (for Python app structure)
- appimage-builder Recipe Reference
- Kiln desktop app icon assets
- Current version from pyproject.toml