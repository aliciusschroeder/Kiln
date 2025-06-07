# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview

Kiln AI is a Rapid AI Prototyping and Dataset Collaboration Tool consisting of:

- **Core Library** (`libs/core/kiln_ai`): Python library for AI model interaction, fine-tuning, and evaluation
- **REST API Server** (`libs/server/kiln_server`): FastAPI-based server exposing core functionality
- **Desktop Application** (`app/desktop`): Native desktop app embedding the server and web UI
- **Web UI** (`app/web_ui`): SvelteKit-based frontend application

## Common Development Commands

### Initial Setup

```bash
# Install uv package manager (required)
# See: https://github.com/astral-sh/uv

# Install Python dependencies
rm -rf .venv
uv venv --python /usr/bin/python3.13
uv sync

# Install Node dependencies for web UI
cd app/web_ui
npm install
```

### Development

Running the web-UI and Python servers separately is useful for development, as both can hot-reload.

```bash
# Run all services with hot-reload
# Terminal 1: Python servers
uv run python -m app.desktop.dev_server

# Terminal 2: Web UI
cd app/web_ui
npm run dev --

# Access at: http://localhost:5173/run
```

### Testing

```bash
# Run all checks (recommended before committing)
uv run ./checks.sh

# Python tests
# Checking Python: Ruff, format, check
# I is import sorting
uvx  ruff check --select I
uvx ruff format --check .

# Checking Types
uv run pyright .
uv run python3 -m pytest --benchmark-quiet -q .

# Web UI: format, lint, check
cd app/web_ui
npm run format_check
npm run lint
npm run check
npm run test_run
cd ../..

```

### Building

```bash
# Build web UI
cd app/web_ui
npm run build

# Build desktop app
cd app/desktop
uv run ./build_desktop_app.sh
```

## Architecture Notes

### Core Library (`libs/core/kiln_ai`)

- **Adapters**: Model integrations via LiteLLM, fine-tuning adapters for OpenAI/Fireworks/Together/Vertex
- **Data Models**: Pydantic models for projects, tasks, prompts, runs, evaluations
- **Key Features**: JSON schema validation, dataset management, G-eval evaluation framework, synthetic data generation

### Server (`libs/server/kiln_server`)

- FastAPI-based REST API
- Endpoints for project, task, prompt, and run management
- Custom error handling with proper HTTP status codes

### Web UI (`app/web_ui`)

- SvelteKit with TypeScript (always use TypeScript, never JavaScript)
- TailwindCSS + DaisyUI for styling
- OpenAPI client generation for type-safe API calls
- Routes follow pattern: `/(app)/[feature]/[project_id]/[task_id]/...`

### Desktop App (`app/desktop`)

- Embeds the server and serves the web UI
- Additional APIs: provider management, fine-tuning, evaluations, data generation
- Platform-specific builds (Windows: .exe, macOS: .dmg, Linux: .AppImage)

## Important Development Guidelines

1. **Python Development**:

   - Always assume Pydantic 2 (not Pydantic 1)
   - Python 3.10+ features are supported
   - Use pytest for tests, focus on brevity with fixtures and parameterization
   - Look for existing test files before creating new ones

2. **TypeScript/Web Development**:

   - Always use TypeScript, never JavaScript
   - Follow existing SvelteKit patterns in the codebase
   - Web UI components are in `src/lib/ui/`

3. **Testing**:

   - Run tests after writing them
   - Python: Use pytest with existing test patterns
   - Web: `cd app/web_ui && npm run test_run`

4. **Code Quality**:

   - The `./checks.sh` script runs all formatting, linting, and tests
   - Python uses Ruff for formatting/linting
   - TypeScript uses ESLint and Prettier

5. **Model Support**:
   - LiteLLM handles most model integrations
   - Custom adapters exist for fine-tuning providers
   - JSON schema validation ensures structured outputs

## Key Technologies

- **Backend**: Python 3.10+, FastAPI, Pydantic 2, LiteLLM, UV for dependencies
- **Frontend**: SvelteKit, TypeScript, TailwindCSS, Vite
- **Testing**: Pytest (Python), Vitest (TypeScript)
- **AI/ML**: Support for OpenAI, Anthropic, Google, AWS, Ollama, and many more via LiteLLM

## Dependency Management with uv

This project is using `uv` for dependency management with multiple `pyproject.toml` files in subdirectories.

To add or remove dependencies, always `cd` into the corresponding subproject directory before using `uv` commands.

Subproject directories:

```
├── .
│   ├── app
│   │   ├── desktop
│   │   │   └── pyproject.toml (kiln-studio-desktop, bundles kiln-server and the web_ui build via pyinstaller)
│   ├── libs
│   │   ├── core
│   │   │   └── pyproject.toml (kiln-ai, kiln-ai package on pypi)
│   │   ├── server
│   │   │   └── pyproject.toml (kiln-server, REST API for the kiln-ai datamodel)
│   └── pyproject.toml (kiln-root)
```

Examples:

- Add runtime dependency: `uv add <package>`
- Add dev dependency: `uv add --dev <package>`
- Remove dependency: `uv remove <package>`
- Sync environment: `uv sync`
