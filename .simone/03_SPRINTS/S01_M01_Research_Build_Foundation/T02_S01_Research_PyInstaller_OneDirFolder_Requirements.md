# T02_S01_Research_PyInstaller_OneDirFolder_Requirements

## Task Overview

**Sprint:** S01_M01_Research_Build_Foundation  
**Task ID:** T02_S01  
**Priority:** High  
**Status:** Not Started  
**Complexity:** Medium

### Goal
Research PyInstaller --onedir requirements and analyze the transition from Kiln's current --onefile Linux builds to --onedir format required for AppImage compatibility.

### Background Context
Kiln currently uses PyInstaller with --onefile for Linux builds, creating a single executable file. AppImage requires --onedir builds which create a directory structure with the main executable and supporting files. This research will establish the technical requirements for making this transition while maintaining all existing functionality.

## Current State Analysis

### 1. Existing Kiln Build Configuration

**Current Build Script:** `/home/alec/Kiln/app/desktop/build_desktop_app.sh`

**Current Linux Configuration (Line 58):**
```bash
PLATFORM_OPTS="--windowed --onefile --splash=../win_splash.png --icon=../mac_icon.png"
```

**Current PyInstaller Command Structure:**
```bash
pyinstaller $(printf %s "$PLATFORM_OPTS")  \
  --add-data "./taskbar.png:." --add-data "../../web_ui/build:./web_ui/build" \
  --noconfirm --distpath=./desktop/build/dist --workpath=./desktop/build/work \
  -n Kiln --specpath=./desktop/build --hidden-import=tiktoken_ext.openai_public --hidden-import=tiktoken_ext \
  --hidden-import=litellm \
  --collect-all=litellm \
  --paths=. ./desktop/desktop.py
```

### 2. Platform Comparison Analysis

**macOS (Already using --onedir):**
```bash
PLATFORM_OPTS="--onedir --windowed --icon=../mac_icon.png --osx-bundle-identifier=com.kiln-ai.kiln.studio"
```

**Windows (Using single file approach):**
```bash
PLATFORM_OPTS="--windowed --splash=../win_splash.png --icon=../win_icon.ico"
```

## Research Requirements

### 1. PyInstaller --onedir Documentation Analysis

**Primary Documentation Focus:**
- **File:** `/home/alec/Kiln/contributing/pyinstaller-doc/usage.rst` - "Bundling to One Folder" section
- **Purpose:** Understanding directory structure and behavioral differences
- **Key Learning Areas:**
  - Directory layout and file organization
  - Startup behavior changes from single file to directory
  - Resource resolution mechanisms
  - Performance implications

**Supporting Documentation:**
- **Platform-specific Notes (Linux)** - Linux-specific considerations
- **"Using `__file__`" and Runtime Information** - Path resolution in bundled environment
- **"When Things Go Wrong" → "Finding out What Went Wrong"** - Debug strategies

### 2. Directory Structure Requirements

**Current Output Structure (--onefile):**
```
desktop/build/dist/
└── Kiln  # Single executable file
```

**Target Output Structure (--onedir):**
```
desktop/build/dist/
└── Kiln/
    ├── Kiln                    # Main executable
    ├── taskbar.png            # System tray icon resource
    ├── web_ui/
    │   └── build/             # React application bundle
    │       ├── index.html
    │       ├── assets/
    │       └── [other UI files]
    ├── _internal/             # PyInstaller runtime files
    │   ├── base_library.zip
    │   ├── libpython*.so
    │   └── [dependencies]
    └── [other bundled files]
```

### 3. Resource Resolution Analysis

**Critical Function Analysis:**
```python
# From desktop.py lines 35-41
def resource_path(relative_path):
    try:
        base_path = sys._MEIPASS  # PyInstaller bundle path
    except Exception:
        base_path = os.path.dirname(__file__)
    return os.path.join(base_path, relative_path)
```

**Research Focus Areas:**
- `sys._MEIPASS` behavior differences between --onefile and --onedir
- Resource loading patterns for taskbar.png and web_ui/build
- Path resolution compatibility across build types
- Potential need for AppImage-specific environment variables

## Technical Implementation Requirements

### 1. Build Script Modifications

**Required Change Analysis:**
```bash
# Current (Line 58):
PLATFORM_OPTS="--windowed --onefile --splash=../win_splash.png --icon=../mac_icon.png"

# Target:
PLATFORM_OPTS="--windowed --onedir --splash=../win_splash.png --icon=../mac_icon.png"
```

**Impact Assessment Areas:**
- `--add-data` directive compatibility with directory structure
- `--distpath` output handling for directory-based builds
- Cross-platform build script logic preservation
- CI/CD pipeline output artifact handling

### 2. Resource Bundling Validation

**Critical Resource Analysis:**
- **Taskbar Icon:** `--add-data "./taskbar.png:."`
- **Web UI Bundle:** `--add-data "../../web_ui/build:./web_ui/build"`
- **Python Dependencies:** `--collect-all=litellm`, hidden imports
- **Native Libraries:** Platform-specific library handling

**Validation Requirements:**
- Ensure all resources are properly included in directory structure
- Verify resource accessibility through `resource_path()` function
- Confirm web UI serving continues to work from bundled location
- Validate SSL certificate handling and external API connectivity

### 3. Performance and Behavior Analysis

**Startup Behavior Research:**
- Directory-based application startup vs single file
- Resource extraction and loading performance
- Memory usage patterns and implications
- Disk I/O characteristics and optimization opportunities

**Cross-Platform Compatibility:**
- Maintain Windows --onefile behavior (no changes)
- Preserve macOS --onedir functionality (already working)
- Ensure Linux --onedir matches macOS patterns where applicable

## PyInstaller AppImage Integration Research

### 1. Test Implementation Analysis

**Reference:** `/home/alec/Kiln/contributing/pyinstaller-with-appimage-tests.md`

**Key Technical Details:**
```bash
# Critical: Uses --onedir for AppImage compatibility
pyi_builder_spec.test_source('print("OK")', app_name=app_name, pyi_args=["--onedir"])
```

**Learning Areas:**
- Real-world PyInstaller + AppImage integration patterns
- Required file layout and metadata structure
- Testing and validation approaches
- Build pipeline integration strategies

### 2. AppImage Structure Requirements

**AppImage Environment Variables:**
- `$APPDIR` - AppImage root directory path
- `$APPIMAGE` - Path to the AppImage file itself
- `$ARGV0` - Original command line invocation

**Integration Planning:**
- How `sys._MEIPASS` relates to `$APPDIR` in AppImage context
- Resource path resolution strategy for AppImage environment
- Runtime environment setup and initialization requirements

## Research Deliverables

### 1. Technical Requirements Documentation

**PyInstaller Configuration Analysis:**
- [ ] Complete --onedir vs --onefile behavioral comparison
- [ ] Directory structure requirements and implications
- [ ] Resource bundling and access patterns
- [ ] Performance characteristics and optimization opportunities

**Build Script Integration Requirements:**
- [ ] Specific line-by-line changes needed in build_desktop_app.sh
- [ ] Cross-platform compatibility preservation strategy
- [ ] Output artifact handling modifications
- [ ] CI/CD pipeline integration considerations

### 2. Resource Resolution Strategy

**Path Resolution Analysis:**
- [ ] `resource_path()` function compatibility with --onedir builds
- [ ] `sys._MEIPASS` behavior documentation in directory-based bundles
- [ ] Web UI bundle serving requirements and modifications
- [ ] Taskbar icon loading validation approach

**AppImage Environment Preparation:**
- [ ] `$APPDIR` integration strategy for future AppImage support
- [ ] Environment variable handling requirements
- [ ] Resource accessibility validation methods

### 3. Implementation Planning

**Transition Strategy:**
- [ ] Step-by-step modification approach for build script
- [ ] Testing and validation procedures for --onedir builds
- [ ] Rollback procedures if issues are discovered
- [ ] Risk mitigation strategies for potential compatibility issues

**Testing Framework:**
- [ ] Functional testing approach for directory-based builds
- [ ] Performance comparison methodology (--onefile vs --onedir)
- [ ] Cross-platform regression testing procedures
- [ ] Resource loading validation tests

## Success Criteria

### Technical Understanding
- [ ] Clear understanding of --onefile to --onedir implications
- [ ] Directory structure requirements fully documented
- [ ] Resource resolution strategy validated for Kiln's needs
- [ ] Performance characteristics understood and documented

### Implementation Readiness
- [ ] Specific build script modifications identified
- [ ] Resource bundling strategy confirmed for --onedir
- [ ] Testing approach established for validation
- [ ] Risk assessment completed with mitigation strategies

### Documentation Quality
- [ ] Step-by-step implementation guide created
- [ ] Technical requirements clearly documented
- [ ] Integration strategy established for existing build system
- [ ] Testing and validation procedures defined

## Implementation Approach

### Phase 1: PyInstaller Documentation Deep Dive
1. Study "Bundling to One Folder" documentation thoroughly
2. Analyze platform-specific considerations for Linux
3. Research runtime information and path resolution mechanisms
4. Document performance and behavioral differences

### Phase 2: Kiln Architecture Analysis
1. Map current --onefile build process to --onedir requirements
2. Analyze resource bundling and loading mechanisms
3. Evaluate `resource_path()` function compatibility
4. Plan modifications needed for directory-based builds

### Phase 3: Integration Planning
1. Design specific build script modifications
2. Plan testing and validation approach
3. Document risk mitigation strategies
4. Prepare implementation roadmap

### Phase 4: AppImage Preparation Research
1. Study PyInstaller + AppImage test implementations
2. Understand AppImage environment requirements
3. Plan integration strategy for future AppImage support
4. Document environment variable handling needs

## Dependencies and Prerequisites

### Documentation Access
- PyInstaller documentation in `/home/alec/Kiln/contributing/pyinstaller-doc/`
- Focus on "Bundling to One Folder" and Linux-specific sections
- Access to AppImage integration test documentation

### Technical Understanding
- Familiarity with PyInstaller bundling mechanisms
- Understanding of Kiln's current build system
- Knowledge of resource loading and path resolution
- Experience with cross-platform build systems

### Kiln Codebase Analysis
- Understanding of desktop.py architecture
- Familiarity with build_desktop_app.sh structure
- Knowledge of web UI integration patterns
- Understanding of resource bundling requirements

## Risk Mitigation

### Compatibility Issues
- Document fallback strategies for resource loading failures
- Plan testing approach for various Linux distributions
- Identify potential performance implications early
- Establish rollback procedures for build system changes

### Resource Resolution Problems
- Research alternative path resolution mechanisms
- Plan validation testing for all bundled resources
- Document troubleshooting approaches for missing resources
- Establish debugging procedures for path resolution issues

### Cross-Platform Impact
- Ensure Windows and macOS builds remain unaffected
- Validate existing --onedir functionality on macOS
- Plan regression testing for all platforms
- Document platform-specific considerations

## Timeline and Next Steps

### Research Timeline
- PyInstaller documentation analysis: 2-3 hours
- Kiln build system analysis: 1-2 hours  
- Integration planning: 2-3 hours
- Documentation creation: 1-2 hours

### Immediate Actions
1. Complete PyInstaller --onedir documentation research
2. Analyze current Kiln build script and resource handling
3. Document specific technical requirements for transition
4. Plan testing and validation approach

### Follow-up Integration
- **Builds on:** T01_S01 (AppImage-builder documentation research)
- **Enables:** T03_S01 (Kiln integration analysis)
- **Prepares:** Future build script modification tasks

---

**Last Updated:** 2025-01-06  
**Assigned To:** Research Phase  
**Related Requirements:** R02 - PyInstaller OneDirFolder Configuration Requirements