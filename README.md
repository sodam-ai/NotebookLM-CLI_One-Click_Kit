# NotebookLM CLI One-Click Kit

> Windows에서 NotebookLM MCP CLI를 **더블클릭 한 번**으로 설치·실행·관리하는 원클릭 툴킷

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![PyPI](https://img.shields.io/badge/PyPI-notebooklm--mcp--cli-orange.svg)](https://pypi.org/project/notebooklm-mcp-cli/)

---

## 프로젝트 개요

**NotebookLM CLI One-Click Kit**은 Google의 [NotebookLM](https://notebooklm.google.com)을  
Claude Desktop, Cursor, VS Code, Gemini CLI 등 AI 도구와 연결해 주는  
[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli) 패키지를  
Windows에서 누구나 쉽게 사용할 수 있도록 만든 **원클릭 설치·실행 도구**입니다.

코딩을 모르는 분, 터미널이 낯선 분도 `.bat` 파일 더블클릭만으로 바로 사용할 수 있습니다.

---

## 주요 기능

| 기능 | 설명 |
|------|------|
| ⚡ 원클릭 설치 | Python과 패키지를 자동으로 탐지·설치 |
| 🔐 Google 로그인 | Chrome 브라우저를 통한 자동 로그인 / 쿠키 파일 수동 로그인 |
| 🚀 MCP 서버 시작 | Claude / Cursor / VS Code / Gemini CLI와 연결되는 MCP 서버 실행 |
| 📚 노트북 관리 | 노트북 목록 조회 / 새 노트북 생성 |
| 🔄 자동 업데이트 | 일반 업데이트 / 강제 최신 버전 재설치 |
| 🗑️ 완전 제거 | 패키지 + 인증 데이터 안전 삭제 |
| ℹ️ 환경 정보 | MCP 설정 JSON 출력 / 설치 경로 확인 |

---

## 필요 환경 (사전 설치 필요)

- **운영체제**: Windows 10 / 11
- **Python**: 3.10 이상 ([다운로드](https://www.python.org/downloads/))
  - 설치 시 **"Add Python to PATH"** 반드시 체크!
- **인터넷 연결**: 패키지 다운로드에 필요

> Python 설치 여부 확인: `시작 메뉴 → cmd → py --version` 입력

---

## 설치 방법

### 방법 1: 원클릭 설치 (권장)

1. 이 저장소의 **Releases** 페이지에서 `NotebookLM-CLI_MCP_One-Click_Kit.7z` 다운로드
2. 압축 해제 (7-Zip 또는 반디집 사용)
3. **`INSTALL.bat`** 더블클릭
4. 완료 메시지가 나타나면 창을 닫고 새 cmd 창 열기

### 방법 2: 직접 복제

```bash
git clone https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit.git
cd NotebookLM-CLI_One-Click_Kit
```

`INSTALL.bat` 더블클릭으로 설치.

---

## 사용 방법

### 1단계: 설치

```
INSTALL.bat  ← 더블클릭
```

Python 탐지 → pip/uv 확인 → notebooklm-mcp-cli 설치 → 검증 순으로 자동 진행됩니다.

### 2단계: 실행 (메뉴)

```
RUN.bat  ← 더블클릭
```

아래 메뉴가 표시됩니다:

```
============================================================
  NotebookLM MCP CLI - Main Menu  v4
============================================================

  -- MCP 서버 --
   1. MCP 서버 시작

  -- 인증 관리 --
   2. 로그인 (자동 - Chrome 브라우저)
   3. 로그인 상태 확인
   4. 수동 로그인 (쿠키 파일)
   5. 인증 도구 단독 실행
   6. 프로필 목록 보기
   7. 로그아웃 / 인증 데이터 삭제

  -- CLI 명령 --
   8. nlm 명령 직접 입력
   9. 노트북 목록
  10. 노트북 생성
  11. AI 도움말 (nlm --ai)

  -- 버전 관리 --
  12. 현재 버전 확인
  13. 일반 업데이트
  14. 강제 최신 업데이트

  -- 정보 --
  15. MCP 설정 JSON 출력
  16. 설치 경로 / 환경 정보

   0. 종료
============================================================
```

**처음 사용 순서**: `2 (로그인)` → `1 (MCP 서버 시작)`

### 3단계: 제거

```
UNINSTALL.bat  ← 더블클릭
```

패키지와 인증 데이터를 완전히 삭제합니다.

---

## MCP 설정 (AI 도구 연결)

MCP 서버를 시작한 뒤, 아래 설정을 각 도구의 설정 파일에 추가합니다.

### 기본 방식 (설치 후 권장)

```json
{
  "mcpServers": {
    "notebooklm-mcp": {
      "command": "notebooklm-mcp"
    }
  }
}
```

### uvx 방식 (설치 없이 실행)

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

### 설정 파일 위치

| 도구 | 설정 파일 경로 |
|------|--------------|
| Claude Desktop | `%APPDATA%\Claude\claude_desktop_config.json` |
| Cursor | `%USERPROFILE%\.cursor\mcp.json` |
| VS Code | `%USERPROFILE%\.vscode\mcp.json` |
| Gemini CLI | `%USERPROFILE%\.gemini\settings.json` |

---

## 폴더 구조

```
NotebookLM-CLI_One-Click_Kit/
├── INSTALL.bat      ← 설치 스크립트 (처음 한 번 실행)
├── RUN.bat          ← 메인 메뉴 (매번 실행)
├── UNINSTALL.bat    ← 완전 제거 스크립트
├── README.md        ← 한국어 설명서 (이 파일)
├── README.en.md     ← English documentation
└── LICENSE          ← 라이선스
```

---

## 운영 시 주의사항

- **Python PATH**: 설치 시 "Add Python to PATH" 체크를 빠뜨렸다면, Python을 재설치하세요.
- **새 cmd 창**: 설치 직후에는 반드시 새 cmd 창을 열어야 `nlm` 명령이 인식됩니다.
- **인증 데이터 위치**: `%USERPROFILE%\.notebooklm-mcp-cli` — 이 폴더에 Google 세션 정보가 저장됩니다. 공용 PC에서 사용 후에는 메뉴 `7번 (로그아웃)`으로 삭제하세요.
- **MCP 설정 수동 제거**: UNINSTALL.bat은 패키지만 제거합니다. AI 도구의 설정 파일에서 `notebooklm-mcp` 항목을 직접 삭제해야 합니다.
- **방화벽 / 안티바이러스**: `.bat` 파일 실행 시 경고가 뜨면 "추가 정보 → 실행" 또는 "허용"을 선택하세요.

---

## 기반 패키지

이 툴킷은 아래 오픈소스 패키지를 래핑합니다:

- **[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli)** by jacob-bd (PyPI)

---

## 라이선스

[MIT License](./LICENSE) © 2026 SoDam AI Studio

---

## 문의 / 기여

Issues와 Pull Requests를 환영합니다.  
→ [GitHub Issues](https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit/issues)
