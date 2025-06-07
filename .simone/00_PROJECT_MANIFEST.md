---
project_name: Kiln AI
current_milestone_id: M01
highest_sprint_in_milestone: S02
current_sprint_id: S01
status: active
last_updated: 2025-06-07 03:02
---

# Project Manifest: Kiln AI

This manifest serves as the central reference point for the Kiln AI project. It tracks the current focus and links to key documentation.

## 1. Project Vision & Overview

Kiln AI is a comprehensive platform for rapid AI prototyping and dataset collaboration. It bridges the gap between technical and non-technical team members by providing intuitive tools for working with AI models while maintaining professional-grade capabilities.

**Core Values:**

- Privacy-first approach with local data storage
- Git-compatible file-based architecture for team collaboration
- Support for 30+ AI providers through unified interfaces
- Zero-code options for non-technical users with full programmatic access

This project follows a milestone-based development approach with structured requirements and sprint planning.

## 2. Current Focus

- **Milestone:** M01 - Linux AppImage Support
- **Sprint:** S01 - Research and Build Foundation

## 3. Sprints in Current Milestone

### S01 Research and Build Foundation (📋 PLANNED)

📋 Complete AppImage-builder and PyInstaller research (R01)
📋 Modify Linux build process to use --onedir (R02)
📋 Establish technical foundation for AppImage support

### S02 AppImage Integration and Deployment (📋 PLANNED)

📋 Create AppImage recipe configuration (R03)
📋 Extend build script with AppImage support (R04)
📋 Update CI/CD pipeline for automated builds (R05)
📋 Test across multiple Linux distributions

## 4. Key Documentation

- [Architecture Documentation](./01_PROJECT_DOCS/ARCHITECTURE.md)
- [Current Milestone Requirements](./02_REQUIREMENTS/M01_Linux_AppImage_Support/)
- [General Tasks](./04_GENERAL_TASKS/)

## 5. Quick Links

- **Current Sprint:** [S01 Sprint Folder](./03_SPRINTS/S01_M01_Research_Build_Foundation/)
- **Active Tasks:** Check sprint folder for T##_S01_\*.md files
- **Project Reviews:** [Latest Review](./10_STATE_OF_PROJECT/)

## 6. Contributing Information

- **Repository:** Public open-source project on GitHub
- **License:** MIT for core library and server, custom EULA for desktop app
- **Contribution Guidelines:** See CONTRIBUTING.md for development setup and standards
- **Code Quality:** All changes must pass `./checks.sh` (includes testing, linting, formatting)
- **CLA Required:** New contributors must agree to contributor license agreement
