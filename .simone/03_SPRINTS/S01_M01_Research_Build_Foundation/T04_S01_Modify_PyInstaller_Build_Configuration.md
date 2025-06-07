---
task_id: T04_S01
sprint_sequence_id: S01
status: open
complexity: Medium
last_updated: 2025-01-06T22:00:00Z
---

# T04_S01_Modify_PyInstaller_Build_Configuration

## Description
Modify the Linux build process in Kiln's desktop application to use PyInstaller's `--onedir` instead of `--onefile` to enable AppImage compatibility. This change is required to fulfill the R02 requirement for AppImage support while maintaining all existing functionality including system tray, web UI serving, and SSL certificate handling.

The current build script uses `--onefile` for Linux builds (line 58 in `build_desktop_app.sh`), which creates a single executable file that is incompatible with AppImage requirements. AppImage requires a directory-based structure that can only be achieved with `--onedir` builds.

## Goal / Objectives
- Change Linux PyInstaller build from `--onefile` to `--onedir` format
- Maintain existing desktop application functionality (system tray, web UI, SSL certificates)
- Preserve Windows and macOS build processes without modification
- Ensure proper directory structure for AppImage compatibility
- Update output path structure to support `dist/kiln/` directory format

## Acceptance Criteria
- [ ] Linux build script modified to use `--onedir` instead of `--onefile`
- [ ] Build output structure changed to directory format (`dist/kiln/` instead of single file)
- [ ] All existing desktop application functionality preserved (system tray, web UI serving, icon loading)
- [ ] Windows and macOS builds remain unaffected
- [ ] Resource path resolution continues to work correctly in directory-based build
- [ ] SSL certificate handling remains functional
- [ ] Build script maintains backward compatibility with existing CI/CD pipeline

## Subtasks

### 1. Analyze Current Build Configuration
- [ ] Review current PyInstaller configuration in `app/desktop/build_desktop_app.sh` (line 58)
- [ ] Document existing Linux-specific platform options
- [ ] Identify all resources bundled with the application (taskbar.png, web_ui/build, etc.)
- [ ] Review PyInstaller command line arguments and their implications

### 2. Modify Linux Build Platform Options
- [ ] Change `PLATFORM_OPTS` for Linux from `--onefile` to `--onedir`
- [ ] Ensure windowed mode and splash screen functionality are preserved
- [ ] Maintain icon specification for Linux builds
- [ ] Verify all `--add-data` directives work with directory structure

### 3. Update Output Path Structure
- [ ] Modify distpath configuration to accommodate directory-based output
- [ ] Ensure output directory structure is `dist/kiln/` format
- [ ] Update any references to single-file executable in build scripts
- [ ] Verify workpath and specpath configurations remain appropriate

### 4. Validate Resource Path Resolution
- [ ] Test `resource_path()` function in `desktop.py` with `--onedir` build
- [ ] Ensure `sys._MEIPASS` correctly resolves in directory-based bundle
- [ ] Verify taskbar icon loading works with new structure
- [ ] Confirm web UI build bundle (`web_ui/build`) is accessible

### 5. Test Cross-Platform Compatibility
- [ ] Verify Windows build process remains unchanged and functional
- [ ] Confirm macOS build process (already using `--onedir`) continues working
- [ ] Test Linux build produces correct directory structure
- [ ] Validate all platforms maintain existing functionality

## Technical Implementation Details

### Current Build Script Analysis
**File:** `/home/alec/Kiln/app/desktop/build_desktop_app.sh`

**Current Linux Configuration (Line 58):**
```bash
PLATFORM_OPTS="--windowed --onefile --splash=../win_splash.png --icon=../mac_icon.png"
```

**Required Change:**
```bash
PLATFORM_OPTS="--windowed --onedir --splash=../win_splash.png --icon=../mac_icon.png"
```

### PyInstaller Command Structure
**Current Command (Lines 66-72):**
```bash
pyinstaller $(printf %s "$PLATFORM_OPTS")  \
  --add-data "./taskbar.png:." --add-data "../../web_ui/build:./web_ui/build" \
  --noconfirm --distpath=./desktop/build/dist --workpath=./desktop/build/work \
  -n Kiln --specpath=./desktop/build --hidden-import=tiktoken_ext.openai_public --hidden-import=tiktoken_ext \
  --hidden-import=litellm \
  --collect-all=litellm \
  --paths=. ./desktop/desktop.py
```

**Key Considerations:**
- `--add-data` directives must work with directory structure
- `--distpath` will create `dist/Kiln/` directory instead of single file
- Entry point remains `./desktop/desktop.py`
- All hidden imports and collection directives remain the same

### Platform Comparison
**macOS (Already using `--onedir`):**
```bash
PLATFORM_OPTS="--onedir --windowed --icon=../mac_icon.png --osx-bundle-identifier=com.kiln-ai.kiln.studio"
```

**Windows (Using single file):**
```bash
PLATFORM_OPTS="--windowed --splash=../win_splash.png --icon=../win_icon.ico"
```

**Linux (Target configuration):**
```bash
PLATFORM_OPTS="--windowed --onedir --splash=../win_splash.png --icon=../mac_icon.png"
```

### Resource Path Validation
**Critical Function in `desktop.py` (Lines 35-41):**
```python
def resource_path(relative_path):
    try:
        base_path = sys._MEIPASS  # PyInstaller bundle path
    except Exception:
        base_path = os.path.dirname(__file__)
    return os.path.join(base_path, relative_path)
```

**Validation Requirements:**
- `sys._MEIPASS` should point to temporary extraction directory in `--onedir` builds
- Relative paths to `taskbar.png` and `web_ui/build` must resolve correctly
- Function should work identically for both `--onefile` and `--onedir` builds

### Output Structure Changes
**Current Output (--onefile):**
```
desktop/build/dist/
└── Kiln  # Single executable file
```

**New Output (--onedir):**
```
desktop/build/dist/
└── Kiln/
    ├── Kiln  # Main executable
    ├── taskbar.png
    ├── web_ui/
    │   └── build/
    │       └── [React app files]
    └── [Python runtime and dependencies]
```

## Implementation Steps

### Step 1: Backup and Prepare
1. Create backup of current `build_desktop_app.sh`
2. Document current Linux build behavior
3. Test current build process to establish baseline

### Step 2: Modify Build Script
1. Edit line 58 in `app/desktop/build_desktop_app.sh`
2. Change `--onefile` to `--onedir` in Linux `PLATFORM_OPTS`
3. Verify no other modifications needed to PyInstaller command

### Step 3: Test and Validate
1. Run Linux build with new configuration
2. Verify directory structure is created correctly
3. Test application startup and functionality
4. Validate resource loading (icons, web UI)
5. Check system tray functionality

### Step 4: Cross-Platform Testing
1. Verify Windows build still works (unchanged)
2. Confirm macOS build continues working (already `--onedir`)
3. Compare functionality across all platforms

## Existing Kiln Patterns and Considerations

### Build System Integration
- Maintains existing npm web UI build process
- Preserves bootloader building functionality (`--build-bootloader` flag)
- Keeps existing PyInstaller hidden imports and collection settings
- Maintains cross-platform detection logic

### Desktop Application Architecture
- System tray functionality using `pystray` library
- Threaded server architecture with `desktop_server.py`
- Web UI serving from bundled React application
- SSL certificate handling for external API calls

### Resource Management
- Taskbar icon loading through `resource_path()` function
- Web UI serving from extracted bundle location
- Proper cleanup on application quit
- Cross-platform path resolution

## Success Metrics
- Linux build produces directory structure instead of single file
- All desktop application features work identically to previous build
- Build time and output size remain reasonable
- No regressions in Windows or macOS builds
- Foundation ready for AppImage integration (future task)

## Risk Mitigation
- Test thoroughly on clean Linux environment
- Maintain ability to rollback to `--onefile` if needed
- Document any behavioral differences between build types
- Ensure CI/CD pipeline compatibility with directory-based output

## Dependencies and Next Steps
- **Depends on:** T01_S01, T02_S01, T03_S01 research completion for AppImage requirements understanding
- **Enables:** Future AppImage-builder integration tasks
- **Testing:** Requires Linux development environment
- **Documentation:** Update any build documentation referencing single-file output

## Output Log
*(This section is populated as work progresses on the task)*

---

**Related Requirements:** R02 - PyInstaller Build Configuration for AppImage Support  
**Sprint:** S01_M01_Research_Build_Foundation  
**Priority:** High  
**Estimated Effort:** 4-6 hours including testing