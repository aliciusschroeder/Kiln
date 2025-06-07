---
sprint_folder_name: S01_M01_Research_Build_Foundation
sprint_sequence_id: S01
milestone_id: M01
title: Research and Build Foundation - AppImage Prerequisites
status: planned
goal: Complete technical research and implement core PyInstaller changes to establish the foundation for AppImage support
last_updated: 2025-06-07T03:02:00Z
---

# Sprint: Research and Build Foundation - AppImage Prerequisites (S01)

## Sprint Goal
Complete technical research and implement core PyInstaller changes to establish the foundation for AppImage support

## Scope & Key Deliverables
- **R01**: Complete AppImage-builder and PyInstaller research with documented findings
- **R02**: Modify Linux build process to use `--onedir` instead of `--onefile`
- Validate that the new build approach works correctly
- Create technical documentation for the implementation approach

## Definition of Done (for the Sprint)
- [ ] All research checklist items in R01 are completed and documented
- [ ] PyInstaller Linux build successfully uses `--onedir` configuration
- [ ] Updated build produces working application bundle in directory format
- [ ] All existing functionality remains intact (system tray, web UI, API calls)
- [ ] SSL certificates are properly bundled and functional
- [ ] Build script changes are tested and documented
- [ ] Technical notes created for AppImage integration approach

## Notes / Retrospective Points
- This sprint establishes the critical foundation that all AppImage work depends on
- Focus on thorough research to avoid issues in implementation sprint
- The `--onedir` change is a significant architectural shift that needs careful testing
- Pay special attention to path resolution and resource loading in the new directory structure