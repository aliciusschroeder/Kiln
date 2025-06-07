# Kiln AI Architecture

## Overview

Kiln AI is a rapid AI prototyping and dataset collaboration tool designed to bridge the gap between technical and non-technical teams in AI development. It provides an intuitive desktop application, a comprehensive Python library, and a REST API server to facilitate AI model development, fine-tuning, evaluation, and synthetic data generation.

### Core Philosophy

- **Privacy-First**: Data remains local - Kiln cannot see user data, supporting both API keys and local Ollama models
- **Git-Compatible**: Dataset format designed for version control and parallel collaboration
- **Accessibility**: No-code interface for non-technical users while providing powerful APIs for developers
- **Extensibility**: Support for multiple AI providers and custom model integration

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                          Desktop Apps                             │
│                   (Windows, macOS, Linux)                         │
│                                                                   │
│  ┌─────────────────┐    ┌──────────────┐    ┌──────────────┐   │
│  │   System Tray   │    │   Web UI     │    │ Desktop      │   │
│  │   Integration   │    │  (SvelteKit) │    │ Server       │   │
│  └─────────────────┘    └──────────────┘    └──────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                         REST API Server                           │
│                          (FastAPI)                                │
│                                                                   │
│  ┌─────────────────┐    ┌──────────────┐    ┌──────────────┐   │
│  │   Project API   │    │   Task API   │    │   Run API    │   │
│  │                 │    │              │    │              │   │
│  └─────────────────┘    └──────────────┘    └──────────────┘   │
│                                                                   │
│  ┌─────────────────┐    ┌──────────────┐    ┌──────────────┐   │
│  │   Prompt API    │    │ Studio APIs  │    │ Provider API │   │
│  │                 │    │              │    │              │   │
│  └─────────────────┘    └──────────────┘    └──────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                         Core Library                              │
│                          (kiln-ai)                                │
│                                                                   │
│  ┌─────────────────┐    ┌──────────────┐    ┌──────────────┐   │
│  │    Data Model   │    │   Adapters   │    │    Utils     │   │
│  │                 │    │              │    │              │   │
│  └─────────────────┘    └──────────────┘    └──────────────┘   │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│                      External Integrations                        │
│                                                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────────┐    │
│  │ AI Providers │  │ Git Repos    │  │ Local File System  │    │
│  │ (OpenAI,     │  │              │  │ (~/Kiln Projects)  │    │
│  │  Anthropic,  │  │              │  │                    │    │
│  │  Ollama...)  │  │              │  │                    │    │
│  └──────────────┘  └──────────────┘  └────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
```

## Component Breakdown

### 1. Core Library (`libs/core/kiln_ai`)

The foundation of Kiln AI, providing data models, AI provider adapters, and utilities.

#### Key Modules:

- **`datamodel/`**: Core data structures and persistence
  - `Project`: Top-level container for related AI tasks
  - `Task`: Specific AI task with schemas and instructions
  - `TaskRun`: Individual executions with inputs/outputs/ratings
  - `Finetune`: Fine-tuning configuration and tracking
  - `DatasetSplit`: Train/test/validation data splits
  - `Eval`: Evaluation configurations and results

- **`adapters/`**: Integration layer for various AI services
  - `model_adapters/`: LiteLLM-based universal model interface
  - `fine_tune/`: Provider-specific fine-tuning implementations
  - `eval/`: Evaluation frameworks (G-Eval, custom evaluators)
  - `data_gen/`: Synthetic data generation
  - `repair/`: Response repair and improvement mechanisms

- **`utils/`**: Common utilities
  - `config.py`: User configuration management
  - `dataset_import.py`: Import external datasets
  - `async_job_runner.py`: Background task execution

### 2. REST API Server (`libs/server/kiln_server`)

FastAPI-based server providing RESTful endpoints for all Kiln operations.

#### API Groups:

- **Project API**: CRUD operations for projects
- **Task API**: Task management and dataset operations
- **Run API**: Execute tasks and manage results
- **Prompt API**: Prompt template management
- **Studio APIs**: Desktop-specific features
  - Fine-tuning management
  - Evaluation orchestration
  - Data generation
  - Provider configuration

### 3. Desktop Application (`app/desktop`)

Cross-platform desktop application packaging the server and web UI.

#### Components:

- **Desktop Server**: Embedded FastAPI server
- **System Tray**: Native OS integration
- **Auto-updater**: Built-in update mechanism
- **Platform-specific builds**: 
  - Windows: PyInstaller + Inno Setup
  - macOS: PyInstaller + DMG packaging
  - Linux: PyInstaller AppImage

### 4. Web UI (`app/web_ui`)

SvelteKit-based responsive web interface.

#### Features:

- **Project Management**: Create and organize AI projects
- **Task Builder**: Visual task creation with JSON schema editor
- **Run Interface**: Execute tasks with various prompt styles
- **Dataset Management**: Browse, filter, and edit datasets
- **Fine-tuning Wizard**: Zero-code model fine-tuning
- **Evaluation Dashboard**: Compare model performance
- **Synthetic Data Generation**: Interactive data generation tools

## Technology Stack

### Backend
- **Python 3.10+**: Core language
- **FastAPI**: REST API framework
- **Pydantic**: Data validation and serialization
- **LiteLLM**: Universal AI provider interface
- **UV**: Python package and environment management

### Frontend
- **SvelteKit**: Full-stack web framework
- **TypeScript**: Type-safe JavaScript
- **TailwindCSS + DaisyUI**: Styling framework
- **Vite**: Build tooling

### AI Integrations
- **OpenAI**: GPT models and fine-tuning
- **Anthropic**: Claude models
- **Google**: Gemini and Vertex AI
- **Fireworks**: Open-source model hosting
- **Ollama**: Local model execution
- **Together AI**: Model hosting and fine-tuning
- **AWS Bedrock**: Enterprise AI services
- **Azure OpenAI**: Enterprise OpenAI deployment

### Desktop
- **PyInstaller**: Python application bundling
- **pystray**: System tray integration
- **Tkinter**: Native UI dialogs

## Key Architectural Decisions

### 1. File-Based Data Model
Kiln uses a file-based approach (`.kiln` JSON files) instead of a traditional database:
- **Git Compatibility**: Easy version control and diff visualization
- **Portability**: No database setup required
- **Collaboration**: Multiple users can work on the same dataset
- **UUIDs**: Prevent merge conflicts in parallel work

### 2. Provider Abstraction
All AI providers are accessed through a unified adapter interface:
- **Flexibility**: Easy to add new providers
- **Consistency**: Same API regardless of provider
- **Feature Parity**: Graceful degradation for unsupported features

### 3. Local-First Privacy
Data never leaves the user's machine unless explicitly shared:
- **No Cloud Storage**: All data stored locally
- **BYOK**: Users provide their own API keys
- **Offline Support**: Works with local Ollama models

### 4. Modular Architecture
Clear separation between core library, server, and UI:
- **Independent Development**: Teams can work on different layers
- **Multiple Interfaces**: Same core supports desktop, web, and API
- **Testing**: Each layer can be tested independently

## Data Flow

### Task Execution Flow
```
User Input → Web UI → REST API → Task Adapter → AI Provider
                                       ↓
User ← Web UI ← REST API ← Task Output ← Model Response
```

### Dataset Management Flow
```
Local Files (.kiln) ↔ Core Library ↔ REST API ↔ Web UI
       ↓
    Git Repo (optional)
```

### Fine-Tuning Flow
```
Dataset Selection → Training Config → Provider API → Training Job
                                           ↓
                                    Model Deployment
                                           ↓
                                    Available in Kiln
```

## Development Workflow

### Setup
1. Install UV for Python management
2. Run `uv sync` in project root
3. Install Node.js and run `npm install` in `app/web_ui`

### Development Mode
```bash
# Terminal 1: API Server
uv run python -m app.desktop.dev_server

# Terminal 2: Web UI
cd app/web_ui
npm run dev
```

### Testing
```bash
# Run all tests
./checks.sh

# Python tests
uv run pytest

# Web UI tests
cd app/web_ui
npm run test
```

### Building
- **Desktop Apps**: `cd app/desktop && uv run ./build_desktop_app.sh`
- **Python Packages**: Managed by UV workspace
- **Web UI**: `cd app/web_ui && npm run build`

## Extension Points

### Adding AI Providers
1. Implement adapter in `libs/core/kiln_ai/adapters/model_adapters/`
2. Register in adapter registry
3. Add UI support in provider configuration

### Custom Evaluators
1. Extend `BaseEvaluator` class
2. Register in evaluation registry
3. Available in UI evaluation wizard

### Custom Data Formats
1. Implement import function in `utils/dataset_import.py`
2. Add format detection logic
3. Map to Kiln data model

## Security Considerations

- **API Keys**: Stored locally in `~/.kiln_settings/config.yaml`
- **No Telemetry**: No usage data collected by default
- **Local Execution**: All processing happens on user's machine
- **Secure Communication**: HTTPS for all external API calls

## Performance Considerations

- **Streaming Responses**: Real-time output for long-running tasks
- **Async Operations**: Non-blocking API calls
- **Lazy Loading**: Datasets loaded on-demand
- **Caching**: Model responses cached to reduce API calls
- **Parallel Testing**: Multi-core test execution

## Future Architecture Directions

- **Plugin System**: User-installable extensions
- **Cloud Sync**: Optional encrypted cloud backup
- **Team Server**: Self-hosted collaboration server
- **Mobile Apps**: iOS/Android dataset management
- **Advanced RAG**: Built-in retrieval augmented generation