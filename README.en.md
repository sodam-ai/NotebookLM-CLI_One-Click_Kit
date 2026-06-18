# NotebookLM-CLI One-Click Kit

> A Windows toolkit that installs, runs, and manages Google **NotebookLM** (an AI notebook that reads
> and summarizes your sources) with **a single double-click**, and connects it to AI assistants
> (Claude Code · Cursor, etc.).
> **No commands required — just pick a number from the menu.**

[![License](https://img.shields.io/badge/License-Apache--2.0-green.svg)](./LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg)](https://www.microsoft.com/windows)
[![PyPI](https://img.shields.io/badge/PyPI-notebooklm--mcp--cli-orange.svg)](https://pypi.org/project/notebooklm-mcp-cli/)

🌐 **Language**: [한국어](./README.md) · **English (this file)**
🔰 Gentler walkthrough: [`GUIDE.en.md`](./GUIDE.en.md) (full beginner guide)

---

## 📑 Contents

1. [Overview](#-overview)
2. [Features](#-features)
3. [Prerequisites / Requirements](#-prerequisites--requirements)
4. [Download / Installation](#-download--installation)
5. [Quick Start (3 minutes)](#-quick-start-3-minutes)
6. [Usage — Menu](#-usage--menu)
7. [Connect AI tools (MCP config)](#-connect-ai-tools-mcp-config)
8. [Commands (reference)](#-commands-reference)
9. [Environment variables](#-environment-variables)
10. [Folder structure](#-folder-structure)
11. [Build · Test · Distribute](#-build--test--distribute)
12. [Troubleshooting](#-troubleshooting)
13. [Operational & security notes](#-operational--security-notes)
14. [Uninstall](#-uninstall)
15. [Upstream package](#-upstream-package)
16. [License · Copyright · Commercial use](#-license--copyright--commercial-use)
17. [Disclaimer](#-disclaimer)

---

## 🧭 Overview

**NotebookLM-CLI One-Click Kit** is a Windows toolkit that wraps the
[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli) PyPI package so that **anyone**
can connect Google [NotebookLM](https://notebooklm.google.com) to AI tools like
Claude Code · Cursor · VS Code · Gemini CLI — **no coding required.**

- Even if you don't code or have never used a terminal, just **double-click `시작하기.bat`** (Start Here).
- Install → log in → (optional) connect AI tool → use — all by **picking numbers** in a black window.

| Item | Value |
|---|---|
| Audience | Total beginners to computers / AI |
| OS | Windows 10 / 11 (Windows only) |
| Difficulty | ★☆☆ (double-click + pick a number) |
| Cost | Kit & underlying tool are **free** (NotebookLM follows Google's policy) |
| Kit license | **Apache-2.0** (commercial use allowed, with conditions — [§16](#-license--copyright--commercial-use)) |
| Underlying tool | `notebooklm-mcp-cli` (**MIT License**, a separate package) |

---

## ✨ Features

| Feature | Description |
|---|---|
| ⚡ One-click install | Auto-detects Python and installs the package via `uv` (preferred) or `pip` |
| 🧭 Easy Start (S) | Guides login → AI connection → first notebook in one flow |
| 🔐 Google login | Auto login via Chrome / manual cookie-file login / per-profile (account) |
| 🚀 MCP server | Start the MCP server for Claude Code · Cursor · VS Code · Gemini CLI |
| 📚 Notebook management | List / create notebooks / run commands directly |
| 🔄 Update | Normal upgrade / force-reinstall the latest |
| 🩺 Diagnose | `nlm doctor` auto-checks install & login problems |
| 🗑️ Clean uninstall | Removes package + auth data + AI links safely (Python is kept) |
| 📖 Glossary (T) | Explains MCP·pip and other jargon in plain words |

---

## 🧰 Prerequisites / Requirements

### Prepare yourself (3 things)

| Item | Why | If you don't have it |
|---|---|---|
| **Internet** | Programs are downloaded online | Connect Wi‑Fi / LAN |
| **Google account** | NotebookLM is a Google service (your everyday Gmail works) | Sign up free at https://accounts.google.com |
| **Chrome** | Used to show the **login window** | Install from https://www.google.com/chrome/ |

### Auto-handled (you can ignore)

- **Python 3.10–3.13** — the runtime. If missing, the installer **tells you how to get it**.
- **uv / pip** — installer helpers, handled **automatically** (uv first → pip fallback).
- **notebooklm-mcp-cli** — the actual tool (command `nlm`), downloaded **automatically** from PyPI.

> 💡 If you install Python yourself, **check "Add Python to PATH"** on the very first screen.
> Verify Python: `Start menu → cmd → py --version`.

---

## ⬇️ Download / Installation

### Option 1: Download the ZIP (easiest, recommended)

1. On this repo, click **`Code ▸ Download ZIP`** (or grab the archive from Releases).
2. **Extract it first** (right-click → "Extract All"). Don't run from inside the archive.
3. In the extracted folder, double-click **`시작하기.bat`** → **`[1] Install`**.

### Option 2: git clone

```bash
git clone https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit.git
cd NotebookLM-CLI_One-Click_Kit
```

Then double-click **`시작하기.bat`** → **`[1] Install`**.

> 📌 The `.bat` files must always stay **together in the same folder**.

---

## 🚀 Quick Start (3 minutes)

| Step | Do | Notes |
|---|---|---|
| 1 | Double-click **`시작하기.bat`** | A black menu window opens |
| 2 | Type **`1`** → Enter | Install (6 automatic steps — wait until done) |
| 3 | Type **`2`** → Enter | The RUN menu opens |
| 4 | Type **`S`** → Enter | **Easy Start** — guided login & AI connection |
| 5 | Done! | Use `[1] Start server`, `[9] List notebooks`, etc. |

---

## 🖥️ Usage — Menu

### 시작하기.bat (Start Here)

| No. | Action |
|---|---|
| 1 | Install (run once, first) |
| 2 | Run (open the menu) |
| 3 | View the guide |
| 4 | Uninstall |
| 0 | Close |

### RUN menu — full

| No. | Action | One-line |
|---|---|---|
| **S** | **Easy Start** | Do this first (login → AI connection → first notebook) |
| **T** | **Glossary** | MCP·pip and other terms in plain words |
| 1 | Start MCP server | Turn on the bridge for AI assistants (stop with `Ctrl+C`) |
| 2 | Google login | Auto login via Chrome (enter a profile if multiple accounts) |
| 3 | Check login | See if you're logged in |
| 4 | Manual login | Cookie-file login (when auto fails) |
| 5 | **Diagnose** | Auto-check the cause (`nlm doctor`) — try this first when stuck |
| 6 | Profiles | List registered accounts (profiles) |
| 7 | Logout | Delete login data (type `yes`) |
| 8 | Direct `nlm` command | Type commands after `nlm` (advanced) |
| 9 | List notebooks | Show your notebooks |
| 10 | Create notebook | Make a new notebook |
| 11 | AI mode | Run `nlm --ai` |
| 12 | Version | Show installed versions |
| 13 | Update | Upgrade to the latest |
| 14 | Force update | Force-reinstall the latest |
| 15 | **Connect AI tools** | Auto-connect Claude Code · Cursor · JSON |
| 16 | Environment info | Show install path, Python path, etc. |
| 0 | Exit | Close the menu |

**First-time flow**: `[1] Install` → `[2] Run` → `[S] Easy Start`.

---

## 🤖 Connect AI tools (MCP config)

To use NotebookLM from Claude Code · Cursor:

1. In the RUN menu, type **`15`** → Enter.
2. Choose **`1`** (Claude Code) / **`2`** (Cursor) / **`3`** (JSON auto) / **`4`** (manual help).
3. **Fully restart the AI app** to apply.

**Manual JSON** (only if auto fails):

```json
{
  "mcpServers": {
    "notebooklm-mcp": { "command": "notebooklm-mcp" }
  }
}
```

**uvx (no install):**

```json
{
  "mcpServers": {
    "notebooklm-mcp": { "command": "uvx", "args": ["--from", "notebooklm-mcp-cli", "notebooklm-mcp"] }
  }
}
```

**Config file locations**

| Tool | Config file path |
|---|---|
| Claude Desktop | `%APPDATA%\Claude\claude_desktop_config.json` |
| Cursor | `%USERPROFILE%\.cursor\mcp.json` |
| VS Code | `%USERPROFILE%\.vscode\mcp.json` |
| Gemini CLI | `%USERPROFILE%\.gemini\settings.json` |

---

## ⌨️ Commands (reference)

> You normally never type these — the menu does it for you. In RUN `[8]`, type only the part **after** `nlm`.

| Command | Description |
|---|---|
| `nlm login` / `nlm login --check` | Google login / check login status |
| `nlm notebook list` / `nlm notebook create "name"` | List / create notebooks |
| `nlm notebook query` | Ask a notebook |
| `nlm source add` | Add sources (URL · Text · Drive · File) |
| `nlm studio create` | Create Studio content (Audio, Video, etc.) |
| `nlm download <type>` | Download artifacts |
| `nlm setup add claude-code\|cursor` | Auto-connect an AI tool |
| `nlm setup list` / `nlm setup remove <tool>` | List / remove connections |
| `nlm doctor` | Auto-diagnose problems |
| `nlm --ai` / `nlm --version` | AI mode / version |
| `notebooklm-mcp` | Run the MCP server (for AI assistants) |

---

## 🔧 Environment variables

- **This kit needs no environment variables.** Install, login, and connection are all handled by the menu.
- Related items:
  - **PATH** — how your PC finds the `nlm` command. Recognized automatically in a **new window** after install (no setup needed).
  - **Auth data path** — `%USERPROFILE%\.notebooklm-mcp-cli` (where Google login data is stored, **on your PC only**).
- No API keys or tokens are entered into or stored by this kit. Google login happens **in the browser**.

---

## 📂 Folder structure

```
NotebookLM-CLI_One-Click_Kit/
├── 시작하기.bat        ← Main entry point (just double-click this)
├── INSTALL.bat         ← Install script (called by Start Here [1])
├── RUN.bat             ← Run menu (called by Start Here [2])
├── UNINSTALL.bat       ← Uninstall script (called by Start Here [4])
├── README.md           ← Korean documentation (GitHub main page)
├── README.en.md        ← This file (English)
├── GUIDE.md            ← Korean full beginner guide
├── GUIDE.en.md         ← English beginner guide
├── 사용설명서.txt       ← Shortest notepad guide (Korean)
├── README.pdf / README.en.pdf   ← README in PDF (identical content)
├── GUIDE.pdf  / GUIDE.en.pdf     ← GUIDE in PDF (identical content)
├── LICENSE             ← Apache License 2.0 full text
├── NOTICE              ← Copyright · third-party · trademark notices
├── .gitattributes      ← Line-ending rules (.bat = CRLF)
└── .gitignore
```

---

## 🏗️ Build · Test · Distribute

This kit is **compile-free Windows batch scripts (.bat) + documentation**.

- **Build**: there is **no build step.** The `.bat` files and docs are used as-is.
- **Test (run verification)**: `시작하기.bat` → `[1] Install` → `[2] Run` → `[5] Diagnose (nlm doctor)`.
  There is no automated test suite; verification is done by **actually double-clicking and running**.
- **Distribute (sharing)**:
  1. **Zip/7z** this folder and share it, or
  2. on GitHub use **`Code ▸ Download ZIP`** or `git clone`.
  - The recipient extracts it and double-clicks `시작하기.bat`.
- **Regenerate PDFs** (developer-only, optional): `pandoc` (Markdown → HTML) + `puppeteer` (HTML → PDF).
  The temp folder `_build/` is excluded from the repo via `.gitignore`.

---

## 🛠️ Troubleshooting

> 💡 Almost everything can be diagnosed with RUN `[5] Diagnose` (`nlm doctor`).

| Symptom | Fix |
|---|---|
| **Window closes instantly** | Keep all `.bat` together → extract the zip → else `cd` into the folder in `cmd` and run `시작하기.bat` (messages stay) |
| `nlm` not found | Not installed yet → `[1] Install` |
| Installed but not detected | Reopen `시작하기.bat → [2]` (PATH refresh; a new window is needed) |
| "Python not found" | Install Python with **"Add Python to PATH"** checked |
| Login window missing / fails | Check Chrome → `[7] Logout` → `[2] Login`, or `[4] Manual login` |
| Looks outdated | `[14] Force update` |
| Connected but AI can't see it | **Fully restart the AI app** |
| Unknown issue | **`[5] Diagnose`** (`nlm doctor`) |

---

## 🔒 Operational & security notes

- **Auth data location**: `%USERPROFILE%\.notebooklm-mcp-cli` stores your Google session.
  On **shared PCs**, delete it via menu `[7] Logout` after use.
- **MCP config cleanup**: `UNINSTALL.bat` removes the package & auth, but you may need to **manually remove** the `notebooklm-mcp` entry from your AI tool's config JSON.
- **New cmd window**: after install, `nlm` is recognized in a fresh window (PATH refresh).
- **SmartScreen / antivirus**: if a `.bat` triggers a warning, choose **"More info → Run anyway"** (only run sources you trust).
- **.bat encoding**: saved for Korean Windows (CP949), so **Korean comments may look garbled on the GitHub web view, but they run correctly**.
- **No secrets**: this kit does not store or transmit passwords, API keys, or tokens.

---

## 🗑️ Uninstall

1. `시작하기.bat` → **`4`** (Uninstall) → Enter
2. Type **`yes`** to confirm → Enter
3. 6 automatic steps: remove AI links → remove package (uv/pip) → delete auth data → verify
4. Done when **"UNINSTALL COMPLETE"** appears.

> ⚠️ **Python is kept on purpose** (other programs may use it).

---

## 📦 Upstream package

This toolkit **wraps (installs & runs)** the following open-source package — it is **not bundled/redistributed** here; it is downloaded from PyPI:

- **[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli)** by jacob-bd — **MIT License** (PyPI: `notebooklm-mcp-cli`, v0.7.6 as of 2026-06)

---

## ⚖️ License · Copyright · Commercial use

### This kit (`.bat` · docs)

- **License: Apache License 2.0** (full text in [`LICENSE`](./LICENSE))
- **Copyright 2026 SoDam AI Studio**
- **Commercial use is allowed.** When you distribute/redistribute, follow Apache-2.0's 4 conditions:
  1. include `LICENSE` · 2. keep `NOTICE` · 3. state your changes · 4. don't misuse SoDam AI Studio's name/marks as an endorsement.

### Underlying tool `notebooklm-mcp-cli`

- **MIT License** (a separate package — not part of this kit). This kit **only downloads it from PyPI**, so the tool is governed by **its own MIT license**; the **upstream repo's LICENSE is authoritative**.

### Trademarks

- "NotebookLM", "Google", "Chrome" are trademarks of **Google LLC**; "Claude" of **Anthropic**; "Cursor" of its owner.
- This kit is **unofficial** and **not affiliated with, endorsed by, or sponsored by** them. Marks are used for identification only.

---

## ⚠️ Disclaimer

- This kit is only a helper that installs/runs the public package `notebooklm-mcp-cli`.
- NotebookLM is a **Google service** subject to **Google's Terms of Service**; you are responsible for your use of automation tools.
- Provided **"AS IS"** with **no warranty of any kind**. The author is **not liable** for data loss or account issues.
- Login data is stored **only on your computer**; the kit does not touch system folders.

---

## 🙋 Contributing

Issues & Pull Requests are welcome → [GitHub Issues](https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit/issues)

— **Apache-2.0** · Copyright 2026 **SoDam AI Studio**
