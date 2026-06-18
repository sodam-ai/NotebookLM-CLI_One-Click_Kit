# NotebookLM-CLI One-Click Kit — Full Beginner Guide (GUIDE)

> A very detailed guide for **people new to computers, AI, and messaging apps**. Follow every line.
> All technical terms are explained in plain words.
>
> 🌐 **Language**: [한국어](./GUIDE.md) · **English (this file)** ｜ Summary: [`README.en.md`](./README.en.md)

---

## 📑 Contents

1. [What is this? (1 minute)](#1-what-is-this-1-minute)
2. [Prerequisites](#2-prerequisites)
3. [Download required programs](#3-download-required-programs)
4. [Install (step by step)](#4-install-step-by-step)
5. [Run / Use](#5-run--use)
6. [Menu — each item](#6-menu--each-item)
7. [Connect to AI assistants](#7-connect-to-ai-assistants)
8. [Workflow](#8-workflow)
9. [Troubleshooting (full)](#9-troubleshooting-full)
10. [FAQ](#10-faq)
11. [Uninstall](#11-uninstall)
12. [Glossary](#12-glossary)
13. [File / data locations](#13-file--data-locations)
14. [Commands (reference)](#14-commands-reference)
15. [License · Copyright · Safety](#15-license--copyright--safety)

---

## 1. What is this? (1 minute)

- **NotebookLM** = Google's "AI notebook" that reads your sources (documents, links), **summarizes**
  them, and **answers questions**.
- Normally you use it on a website with your mouse.
- This **kit (NotebookLM-CLI One-Click Kit)** lets you use it from your **computer commands** and
  **AI assistants** (Claude, Cursor).
- No commands needed — **just pick a number** in the black window.

---

## 2. Prerequisites

1. **Internet** (Wi‑Fi/LAN) — programs are downloaded online.
2. **Google account** — NotebookLM is a Google service (your everyday Gmail works).
   Sign up free at https://accounts.google.com.
3. **Chrome browser** — used for the login window (https://www.google.com/chrome/).

Everything else (Python, etc.) is handled **automatically** during install.

---

## 3. Download required programs

This kit needs **Python** (versions **3.10–3.13**). It's usually auto-guided, but to install manually:

1. Go to **https://www.python.org/downloads/**
2. Click the yellow **"Download Python 3.x.x"** button.
3. Run the file. ⚠️ **Check "Add Python to PATH"** on the first screen (critical!).
4. Click **"Install Now"** → wait → **"Close"**.
5. Return to `시작하기.bat`.

> `uv` and `notebooklm-mcp-cli` are installed **automatically** during setup (uv first, pip as fallback).

---

## 4. Install (step by step)

1. Open the kit folder (extract the zip first if needed — right-click → "Extract All").
2. Double-click **`시작하기.bat`**.
3. Press **`1`** + Enter (Install). Press any key to proceed.
4. It runs **6 steps automatically** (nothing for you to do but wait):

   | Step | On screen | What it does |
   |---|---|---|
   | `[1/6]` | Internet check | Checks your connection |
   | `[2/6]` | Find Python | Auto-detects Python |
   | `[3/6]` | pip check | Prepares the installer (pip) |
   | `[4/6]` | uv check/install | Prepares the fast installer (uv) |
   | `[5/6]` | Install notebooklm-mcp-cli | **Downloads the tool — wait a bit** |
   | `[6/6]` | Verify | Checks `nlm` version |

5. When **"INSTALLATION COMPLETE"** appears, you're done.

> If "Python not found" appears, install Python (§3, **check "Add Python to PATH"**) and run `[1] Install` again.

---

## 5. Run / Use

1. `시작하기.bat` → **`2`** (Run) → Enter.
2. The RUN menu opens.
3. First time? Press **`S`** (Easy Start) — it guides you:
   - **Login**: when Chrome opens, log in with your Google account as usual.
   - **AI connection** (optional): choose Claude Code (`1`) or Cursor (`2`) — or press Enter to skip.
   - **First notebook** (optional): type a name — or press Enter to skip.
4. Then use `[9] List notebooks`, `[1] Start server`, etc.

> If you see "[!] not installed yet" at the top, run `[1] Install` first.

---

## 6. Menu — each item

| No. | Name | Detail |
|---|---|---|
| **S** | Easy Start | Login → AI connection → first notebook in one flow. **Do this first.** |
| **T** | Glossary | Explains MCP·pip and other terms in plain words |
| 1 | Start MCP server | Turns on the "bridge" so AI assistants can reach NotebookLM. **Stop with `Ctrl+C`** |
| 2 | Google login | Auto login via Chrome. Enter a profile name if you have multiple accounts |
| 3 | Check login | See if you're currently logged in |
| 4 | Manual login | When auto fails, log in with a **cookie file** (enter its path) |
| 5 | **Diagnose** | Auto-checks the cause (`nlm doctor`). **Try this first when stuck** |
| 6 | Profiles | List registered accounts (profiles) |
| 7 | Logout | Delete login data. **Type `yes`** to proceed. Re-login via `[2]` |
| 8 | Direct `nlm` command | Type commands after `nlm` (advanced). E.g. `notebook list` (Enter = help) |
| 9 | List notebooks | Shows your notebooks |
| 10 | Create notebook | Enter a name to create a new notebook |
| 11 | AI mode | Runs `nlm --ai` (detailed help for AI assistants) |
| 12 | Version | Shows installed versions (nlm·uv·pip) |
| 13 | Update | Upgrade to the latest |
| 14 | Force update | **Force-reinstall** the latest (when outdated) |
| 15 | **Connect AI tools** | Auto-connect Claude Code·Cursor·JSON (see §7) |
| 16 | Environment info | Shows install path, Python path, auth folder, etc. |
| 0 | Exit | Close the menu |

---

## 7. Connect to AI assistants

1. In the RUN menu, type **`15`** → Enter.
2. Choose a method:
   - **`1`** Claude Code (auto)
   - **`2`** Cursor (auto)
   - **`3`** JSON auto-config for supported tools
   - **`4`** Manual help (JSON examples for Claude Desktop / VS Code / Gemini)
3. When "connection attempted" appears, it worked.
4. **Fully restart the AI app** so the connection takes effect.

> No manual file editing needed. For manual setup, `[15] → 4` shows JSON examples and file paths.

**Manual JSON** (only if auto fails):

```json
{
  "mcpServers": {
    "notebooklm-mcp": { "command": "notebooklm-mcp" }
  }
}
```

Config file locations: Claude Desktop `%APPDATA%\Claude\claude_desktop_config.json` ·
Cursor `%USERPROFILE%\.cursor\mcp.json` · VS Code `%USERPROFILE%\.vscode\mcp.json` ·
Gemini CLI `%USERPROFILE%\.gemini\settings.json`

---

## 8. Workflow

```
1) Install : 시작하기.bat → [1]        (notebooklm-mcp-cli auto-downloaded & installed)
2) Login   : [2] Run → [2] Login        (Chrome → Google login; auth stays on your PC)
3) Connect : [15] → Claude Code/Cursor  (optional)
4) Use     : [1] Start server / [9] List notebooks / AI assistant calls it
```

- You only **install + log in once**; afterwards just use `[2] Run`.
- Auth data is stored **only on your PC** (`%USERPROFILE%\.notebooklm-mcp-cli`).

---

## 9. Troubleshooting (full)

> 💡 When stuck, try `[5] Diagnose` (`nlm doctor`) first — it usually finds the cause.

### 9-1. Window closes instantly (most common)

Usually because (a) the `.bat` files are scattered, or (b) the zip wasn't extracted.

Fix:
1. Make sure `시작하기.bat`, `INSTALL.bat`, `RUN.bat`, `UNINSTALL.bat` are **in the same folder**.
2. If you got a zip, **extract it** and run from the extracted folder.
3. If it still closes, keep the messages on screen:
   - Press **`Win`** → type `cmd` → Enter (a black window opens)
   - Copy the kit folder path from File Explorer's address bar
   - Type `cd ` (with a space) + paste → Enter
   - Type `시작하기.bat` → Enter
   - Now the error text **stays**. Match it in the table below.

### 9-2. Symptom table

| Symptom | Fix |
|---|---|
| `nlm` not found | Not installed yet → `[1] Install` |
| "Python not found" | Install Python (§3) with **"Add Python to PATH"** checked |
| Installed but RUN doesn't detect it | Close & reopen `시작하기.bat` → `[2]` (PATH refresh) |
| Internet warning | Check Wi‑Fi/LAN and firewall, then retry |
| Login window doesn't open | Check Chrome → `[7] Logout` → `[2] Login` |
| Auto-login keeps failing | `[4] Manual login` (cookie file) |
| Looks outdated | `[14] Force update` |
| Connected but AI can't see it | **Fully restart the AI app** |
| Unknown issue | **`[5] Diagnose`** (`nlm doctor`) |

---

## 10. FAQ

**Q. Does it cost money?**
A. The kit and the underlying tool are **free**. NotebookLM itself follows Google's policy (has a free tier).

**Q. Do I need internet?**
A. Yes — when **installing** and when **using NotebookLM**.

**Q. Does my data leak out?**
A. Google login data is stored **only on your computer**. This kit does not send your data anywhere.

**Q. Does it work on Mac?**
A. The `.bat` files are **Windows-only**. On Mac, install the underlying tool (`notebooklm-mcp-cli`) directly.

**Q. I think I installed it wrong. How do I start over?**
A. Use `[4] Uninstall` to clean up, then `[1] Install` again.

**Q. Can I delete Python?**
A. This kit does **not** delete Python. Other programs may use it, so it's best to keep it.

**Q. I have multiple accounts. Can I separate them?**
A. Yes. Enter a **profile name** at `[2] Login`; each account is stored separately. Check with `[6] Profiles`.

---

## 11. Uninstall

1. `시작하기.bat` → **`4`** (Uninstall) → Enter
2. Type **`yes`** to confirm → Enter
3. **6 automatic steps**:
   - Remove AI links → remove via uv → remove via pip → delete login data → final verify
4. Done when **"UNINSTALL COMPLETE"** appears.
5. **Python is kept** (intentional — other programs may use it).

> If an AI link isn't removed automatically, delete just the `notebooklm-mcp` entry from the config file (§13).

---

## 12. Glossary

| Term | Plain meaning |
|---|---|
| **NotebookLM** | Google's AI notebook that reads your sources and summarizes/answers |
| **nlm** | The tool name that controls NotebookLM via computer commands |
| **MCP** | A "bridge" connecting AI assistants (Claude·Cursor) to this tool. Turn it on and the AI sees your NotebookLM |
| **server** | The "conversation channel" started by `[1]`. Stop with `Ctrl+C` |
| **Python / pip** | The runtime & installer this tool needs (handled automatically) |
| **uv** | A faster modern installer (automatic) |
| **PATH** | How your PC finds the `nlm` command. Recognized in a **new window** after install |
| **profile** | A login label stored separately per account |
| **cookie** | A small file holding your login state. Used for manual login |

---

## 13. File / data locations

**Inside the kit folder:**
`시작하기.bat` (main) · `INSTALL.bat` · `RUN.bat` · `UNINSTALL.bat` ·
`README.md` (Korean) · `README.en.md` (English) · `GUIDE.md` (Korean) · `GUIDE.en.md` (this file) ·
`사용설명서.txt` (short, Korean) · `README.pdf`·`README.en.pdf`·`GUIDE.pdf`·`GUIDE.en.pdf` (PDF, identical content) ·
`LICENSE` · `NOTICE`

**Data stored on your PC:**
`%USERPROFILE%\.notebooklm-mcp-cli` (Google login data, **on your PC only**)
Note: `%USERPROFILE%` is usually `C:\Users\<your name>`.

**AI tool config files (only when connected):**
Claude Desktop `%APPDATA%\Claude\claude_desktop_config.json` ·
Cursor `%USERPROFILE%\.cursor\mcp.json` ·
VS Code `%USERPROFILE%\.vscode\mcp.json` ·
Gemini CLI `%USERPROFILE%\.gemini\settings.json`

---

## 14. Commands (reference)

> You normally never type these — the menu does it. In RUN `[8]`, type only the part **after** `nlm`.

| Command | Description |
|---|---|
| `nlm login` | Google login (Chrome, auto) |
| `nlm login --check` | Check login status |
| `nlm notebook list` | List your notebooks |
| `nlm notebook create "name"` | Create a new notebook |
| `nlm notebook query` | Ask a notebook |
| `nlm source add` | Add sources (URL · Text · Drive · File) |
| `nlm studio create` | Create Studio content (Audio, Video, etc.) |
| `nlm download <type>` | Download artifacts |
| `nlm setup add claude-code` | Auto-connect Claude Code |
| `nlm setup add cursor` | Auto-connect Cursor |
| `nlm setup list` | List connected AI tools |
| `nlm setup remove <tool>` | Disconnect a tool |
| `nlm doctor` | Auto-diagnose problems |
| `nlm --ai` | AI mode (help for AI assistants) |
| `nlm --version` | Show version |
| `notebooklm-mcp` | Run the MCP server (for AI assistants) |

---

## 15. License · Copyright · Safety

- **This kit:** **Apache License 2.0**, Copyright 2026 **SoDam AI Studio** (full text in `LICENSE`, notices in `NOTICE`).
  Commercial use allowed; when distributing, ① include `LICENSE` ② keep `NOTICE` ③ state changes ④ don't misuse the marks.
- **Underlying tool `notebooklm-mcp-cli`:** **MIT License** (separate package; confirmed on PyPI & GitHub; v0.7.6 as of 2026-06).
  This kit **does not bundle** it — it only **downloads from PyPI**. The **upstream repo's LICENSE is authoritative**.
  Source: https://github.com/jacob-bd/notebooklm-mcp-cli
- **Trademarks:** "NotebookLM/Google/Chrome" (Google LLC), "Claude" (Anthropic), "Cursor" (its owner).
  This kit is **unofficial** and not affiliated with them; marks are used for identification only.
- **Safety:** login data is stored **only on your computer**; the kit doesn't touch system folders.
  Provided **"AS IS"**; you are responsible for your use.

---

— **Apache-2.0** · Copyright 2026 **SoDam AI Studio** · an unofficial helper
