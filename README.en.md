# NotebookLM CLI One-Click Kit

> Install, run, and manage NotebookLM MCP CLI on Windows with **a single double-click**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![PyPI](https://img.shields.io/badge/PyPI-notebooklm--mcp--cli-orange.svg)](https://pypi.org/project/notebooklm-mcp-cli/)

---

## Overview

**NotebookLM CLI One-Click Kit** is a Windows batch script toolkit that wraps the  
[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli) PyPI package,  
letting anyone connect Google [NotebookLM](https://notebooklm.google.com) to AI tools  
like Claude Desktop, Cursor, VS Code, and Gemini CLI — no coding required.

---

## Features

| Feature | Description |
|---------|-------------|
| ⚡ One-click install | Auto-detects Python & installs the package via uv or pip |
| 🔐 Google login | Auto login via Chrome browser / manual cookie-file login |
| 🚀 MCP server | Start the MCP server for Claude / Cursor / VS Code / Gemini |
| 📚 Notebook management | List notebooks / create new notebooks |
| 🔄 Auto-update | Normal upgrade / force-reinstall latest version |
| 🗑️ Clean uninstall | Remove package + auth data safely |
| ℹ️ Environment info | Print MCP config JSON / show install paths |

---

## Requirements

- **OS**: Windows 10 / 11
- **Python**: 3.10 or later ([Download](https://www.python.org/downloads/))
  - Check **"Add Python to PATH"** during installation!
- **Internet**: Required for package download

> Verify Python: open cmd → type `py --version`

---

## Installation

### Option 1: One-click (recommended)

1. Download `NotebookLM-CLI_MCP_One-Click_Kit.7z` from the **Releases** page
2. Extract with 7-Zip or a similar tool
3. Double-click **`INSTALL.bat`**
4. When "INSTALLATION COMPLETE" appears, close the window and open a new cmd

### Option 2: Clone

```bash
git clone https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit.git
cd NotebookLM-CLI_One-Click_Kit
```

Then double-click `INSTALL.bat`.

---

## Usage

### Step 1: Install

```
INSTALL.bat  ← double-click
```

Auto-detects Python → verifies pip/uv → installs notebooklm-mcp-cli → verifies.

### Step 2: Run (menu)

```
RUN.bat  ← double-click
```

Interactive menu with 16 options:

```
============================================================
  NotebookLM MCP CLI - Main Menu  v4
============================================================

  -- MCP Server --
   1. Start MCP server

  -- Authentication --
   2. Login (auto - Chrome browser)
   3. Check login status
   4. Manual login (cookie file)
   5. Run auth tool standalone
   6. List profiles
   7. Logout / delete auth data

  -- CLI Commands --
   8. Run nlm command directly
   9. List notebooks
  10. Create notebook
  11. AI help (nlm --ai)

  -- Version Management --
  12. Check current version
  13. Normal update (uv tool upgrade)
  14. Force latest update (uv install --force)

  -- Info --
  15. Print MCP config JSON
  16. Install path / environment info

   0. Exit
============================================================
```

**First-time flow**: `2 (Login)` → `1 (Start MCP server)`

### Step 3: Uninstall

```
UNINSTALL.bat  ← double-click
```

Safely removes the package and all auth data.

---

## MCP Configuration

After starting the MCP server, add one of the following to your AI tool's config file.

### Standard (after install)

```json
{
  "mcpServers": {
    "notebooklm-mcp": {
      "command": "notebooklm-mcp"
    }
  }
}
```

### uvx (no install needed)

```json
{
  "mcpServers": {
    "notebooklm-mcp": {
      "command": "uvx",
      "args": ["--from", "notebooklm-mcp-cli", "notebooklm-mcp"]
    }
  }
}
```

### Config file locations

| Tool | Config file path |
|------|-----------------|
| Claude Desktop | `%APPDATA%\Claude\claude_desktop_config.json` |
| Cursor | `%USERPROFILE%\.cursor\mcp.json` |
| VS Code | `%USERPROFILE%\.vscode\mcp.json` |
| Gemini CLI | `%USERPROFILE%\.gemini\settings.json` |

---

## Folder Structure

```
NotebookLM-CLI_One-Click_Kit/
├── INSTALL.bat      ← Run once to install
├── RUN.bat          ← Main menu (run each time)
├── UNINSTALL.bat    ← Full removal
├── README.md        ← Korean documentation
├── README.en.md     ← This file (English)
└── LICENSE
```

---

## Important Notes

- **Python PATH**: If you missed "Add Python to PATH", reinstall Python and check the box.
- **New cmd window**: After install, open a fresh cmd window so `nlm` is recognized.
- **Auth data location**: `%USERPROFILE%\.notebooklm-mcp-cli` — stores your Google session. On shared PCs, use menu `7 (Logout)` after use.
- **MCP config cleanup**: UNINSTALL.bat only removes the package. Manually remove the `notebooklm-mcp` entry from your AI tool's config file.
- **Firewall / antivirus**: If Windows SmartScreen warns on `.bat` files, click "More info → Run anyway".

---

## Upstream Package

This toolkit wraps the following open-source package:

- **[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli)** by jacob-bd (PyPI)

---

## License

[MIT License](./LICENSE) © 2026 SoDam AI Studio

---

## Contributing

Issues and Pull Requests are welcome.  
→ [GitHub Issues](https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit/issues)
