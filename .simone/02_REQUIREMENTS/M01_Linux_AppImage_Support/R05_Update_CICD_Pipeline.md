# Requirement R05: Update CI/CD Pipeline

## Description
Modify the GitHub Actions CI/CD pipeline to automatically build AppImages for Linux releases and make them available as artifacts.

## Acceptance Criteria

1. **Workflow Configuration**
   - [ ] Add appimage-builder to Linux runner dependencies
   - [ ] Update build job to use AppImage build flag
   - [ ] Configure artifact upload for AppImage files
   - [ ] Ensure proper file naming for releases

2. **Release Integration**
   - [ ] Include AppImage in GitHub releases
   - [ ] Update release notes template to mention AppImage
   - [ ] Configure proper asset naming convention
   - [ ] Test release workflow end-to-end

3. **Testing & Validation**
   - [ ] Add AppImage smoke test in CI
   - [ ] Verify AppImage can launch in CI environment
   - [ ] Test download and execution workflow
   - [ ] Validate file permissions and structure

4. **Documentation**
   - [ ] Update CI/CD documentation
   - [ ] Document AppImage build process
   - [ ] Add troubleshooting notes for CI failures
   - [ ] Update README with AppImage download info

## Technical Details

### Current CI Workflow
- GitHub Actions builds for Windows, macOS, Linux
- Linux currently produces single executable
- Artifacts uploaded for each platform
- Release workflow publishes to GitHub releases

### Required Changes
```yaml
# In .github/workflows/
- name: Install AppImage builder (Linux)
  if: matrix.os == 'ubuntu-latest'
  run: |
    sudo apt-get update
    sudo apt-get install -y appimage-builder

- name: Build Desktop App (Linux with AppImage)
  if: matrix.os == 'ubuntu-latest'
  run: |
    cd app/desktop
    ./build_desktop_app.sh --appimage
```

### Artifacts & Naming
- Traditional Linux build: `Kiln.Linux.tar.gz`
- New AppImage: `Kiln.Linux.AppImage`
- Maintain both during transition period
- Version tagging integration

## Dependencies
- R04 (Build script changes) must be completed
- Access to GitHub Actions configuration
- Testing on Linux CI runner environment