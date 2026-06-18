# NotebookLM-CLI One-Click Kit

> 구글 **NotebookLM**(내가 올린 자료를 읽고 요약·답변해 주는 AI 노트)을 Windows에서
> **더블클릭 한 번**으로 설치·실행·관리하고, AI 비서(Claude Code · Cursor 등)와 연결해 주는 **원클릭 툴킷**입니다.
> **명령어를 몰라도 됩니다. 메뉴에서 번호만 누르면 됩니다.**

[![License](https://img.shields.io/badge/License-Apache--2.0-green.svg)](./LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue.svg)](https://www.microsoft.com/windows)
[![PyPI](https://img.shields.io/badge/PyPI-notebooklm--mcp--cli-orange.svg)](https://pypi.org/project/notebooklm-mcp-cli/)

🌐 **언어 / Language**: **한국어(이 문서)** · [English](./README.en.md)
🔰 더 쉬운 설명: [`GUIDE.md`](./GUIDE.md)(왕초보 완전 가이드) · [`사용설명서.txt`](./사용설명서.txt)(가장 짧음)

---

## 📑 목차

1. [프로젝트 개요](#-프로젝트-개요)
2. [주요 기능](#-주요-기능)
3. [사전 준비물 / 필요 환경](#-사전-준비물--필요-환경)
4. [다운로드 / 설치 방법](#-다운로드--설치-방법)
5. [빠른 시작 (3분)](#-빠른-시작-3분)
6. [사용 방법 — 메뉴](#-사용-방법--메뉴)
7. [AI 도구 연결 (MCP 설정)](#-ai-도구-연결-mcp-설정)
8. [명령어 모음 (참고용)](#-명령어-모음-참고용)
9. [환경 변수](#-환경-변수)
10. [폴더 구조](#-폴더-구조)
11. [빌드 · 테스트 · 배포](#-빌드--테스트--배포)
12. [문제 · 오류 대처](#-문제--오류-대처)
13. [운영 · 보안 주의사항](#-운영--보안-주의사항)
14. [제거(삭제) 방법](#-제거삭제-방법)
15. [기반 패키지](#-기반-패키지)
16. [라이선스 · 저작권 · 상업적 용도](#-라이선스--저작권--상업적-용도)
17. [면책 고지](#-면책-고지)

---

## 🧭 프로젝트 개요

**NotebookLM-CLI One-Click Kit**은 구글 [NotebookLM](https://notebooklm.google.com)을
Claude Code · Cursor · VS Code · Gemini CLI 등 AI 도구와 연결해 주는
[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli) 패키지를
**Windows에서 누구나 쉽게** 쓸 수 있도록 만든 **원클릭 설치·실행 도구**입니다.

- 코딩을 모르는 분, 터미널이 낯선 분도 **`시작하기.bat` 더블클릭** 한 번이면 됩니다.
- 설치 → 로그인 → (선택) AI 연결 → 사용까지 **검은 창에서 번호만** 누르면 됩니다.

| 구분 | 내용 |
|---|---|
| 대상 | 컴퓨터·AI가 처음인 완전 초보자 |
| 운영체제 | Windows 10 / 11 (윈도우 전용) |
| 설치 난이도 | ★☆☆ (파일 더블클릭 + 번호 누르기) |
| 비용 | 키트·원본 도구 **무료** (NotebookLM 자체는 구글 정책에 따름) |
| 키트 라이선스 | **Apache-2.0** (상업적 사용 가능, 조건 있음 — [16장](#-라이선스--저작권--상업적-용도)) |
| 원본 도구 | `notebooklm-mcp-cli` (**MIT License**, 별도 패키지) |

---

## ✨ 주요 기능

| 기능 | 설명 |
|---|---|
| ⚡ 원클릭 설치 | Python을 자동 탐지하고 `uv`(우선) 또는 `pip`로 패키지 자동 설치 |
| 🧭 쉬운 시작(S) | 로그인 → AI 연결 → 첫 노트북까지 한 번에 안내 |
| 🔐 구글 로그인 | Chrome 자동 로그인 / 쿠키 파일 수동 로그인 / 프로필(계정)별 분리 |
| 🚀 MCP 서버 | Claude Code · Cursor · VS Code · Gemini CLI와 연결되는 MCP 서버 실행 |
| 📚 노트북 관리 | 노트북 목록 조회 / 새 노트북 생성 / 직접 명령 |
| 🔄 업데이트 | 일반 업데이트 / 강제 최신 재설치 |
| 🩺 진단 | `nlm doctor`로 설치·로그인 문제 자동 점검 |
| 🗑️ 완전 제거 | 패키지 + 인증 데이터 + AI 도구 연결 안전 삭제 (Python은 보존) |
| 📖 용어 풀이(T) | MCP·pip 등 어려운 말을 쉬운 말로 |

---

## 🧰 사전 준비물 / 필요 환경

### 미리 준비할 것 3가지 (사람이 직접)

| 준비물 | 왜 필요한가 | 없으면 |
|---|---|---|
| **인터넷 연결** | 프로그램을 인터넷에서 내려받아야 해서 | 와이파이/랜선 연결 |
| **구글 계정** | NotebookLM 은 구글 서비스라서 (평소 G메일이면 됨) | https://accounts.google.com 무료 가입 |
| **크롬(Chrome)** | 구글 **로그인 창**을 띄우는 데 사용 | https://www.google.com/chrome/ |

### 자동 처리되는 것 (신경 안 써도 됨)

- **Python 3.10 ~ 3.13** — 도구가 돌아가는 기반. 없으면 설치 화면이 **받는 법을 안내**합니다.
- **uv / pip** — 설치 도우미. 설치 과정에서 **자동**(uv 우선 → 실패 시 pip).
- **notebooklm-mcp-cli** — 실제 본체(명령어 `nlm`). PyPI 에서 **자동** 다운로드.

> 💡 **파이썬을 직접 설치할 때 가장 중요한 한 가지**: 첫 화면 맨 아래 **"Add Python to PATH"** 를 **반드시 체크(✔)** 하세요.
> Python 설치 여부 확인: `시작 메뉴 → cmd → py --version` 입력.

---

## ⬇️ 다운로드 / 설치 방법

### 방법 1: 압축본으로 받기 (가장 쉬움, 권장)

1. 이 저장소에서 **`Code ▸ Download ZIP`** (또는 Releases의 압축본)을 받습니다.
2. **압축을 먼저 풉니다** (오른쪽 클릭 → "압축 풀기"). 압축 안에서 바로 실행하면 안 됩니다.
3. 푼 폴더에서 **`시작하기.bat`** 더블클릭 → **`[1] 설치하기`**.

### 방법 2: git 으로 받기

```bash
git clone https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit.git
cd NotebookLM-CLI_One-Click_Kit
```

그다음 **`시작하기.bat`** 더블클릭 → **`[1] 설치하기`**.

> 📌 `.bat` 파일들은 항상 **같은 폴더에 함께** 있어야 합니다. 한 개만 따로 옮기면 안 됩니다.

---

## 🚀 빠른 시작 (3분)

| 순서 | 할 일 | 설명 |
|---|---|---|
| 1 | **`시작하기.bat` 더블클릭** | 검은 메뉴 창이 열립니다 |
| 2 | **`1`** → Enter | 설치 (6단계 자동 진행, 끝까지 기다리기) |
| 3 | **`2`** → Enter | 사용 메뉴(RUN)가 열립니다 |
| 4 | **`S`** → Enter | **쉬운 시작** — 로그인·AI 연결을 차근차근 안내 |
| 5 | 끝! | 이제 `[1] 서버 시작`, `[9] 노트북 목록` 등을 자유롭게 |

---

## 🖥️ 사용 방법 — 메뉴

### 시작하기.bat (첫 화면)

| 번호 | 기능 |
|---|---|
| 1 | 설치하기 (제일 먼저 한 번) |
| 2 | 사용하기 (사용 메뉴 열기) |
| 3 | 사용설명서 보기 |
| 4 | 제거하기 |
| 0 | 닫기 |

### 사용하기(RUN) 메뉴 — 전체

| 번호 | 기능 | 한 줄 설명 |
|---|---|---|
| **S** | **쉬운 시작** | 처음이라면 이것부터 (로그인 → AI 연결 → 첫 노트북) |
| **T** | **용어 풀이** | MCP·pip 같은 어려운 말을 쉽게 |
| 1 | MCP 서버 시작 | AI 비서가 접속하도록 켜기 (끄려면 `Ctrl+C`) |
| 2 | 구글 로그인 | 크롬 자동 로그인 (계정 여러 개면 프로필 입력) |
| 3 | 로그인 확인 | 지금 로그인돼 있는지 점검 |
| 4 | 수동 로그인 | 쿠키 파일로 로그인 (자동이 안 될 때) |
| 5 | **진단하기** | 원인 자동 점검 (`nlm doctor`) — 막히면 우선 이것 |
| 6 | 프로필 목록 | 등록된 계정(프로필) 보기 |
| 7 | 로그아웃 | 로그인 정보 삭제 (`yes` 입력) |
| 8 | nlm 직접 명령 | `nlm` 뒤 명령을 직접 입력 (고급) |
| 9 | 노트북 목록 | 내 노트북 보기 |
| 10 | 노트북 만들기 | 새 노트북 생성 |
| 11 | AI 모드 | `nlm --ai` 실행 |
| 12 | 버전 확인 | 설치된 버전 보기 |
| 13 | 업데이트 | 최신으로 올리기 |
| 14 | 강제 최신 업데이트 | 최신 버전 강제 재설치 |
| 15 | **AI 도구 연결** | Claude Code · Cursor · JSON 자동 연결 |
| 16 | 환경 정보 | 설치 위치·파이썬 위치 등 확인 |
| 0 | 종료 | 메뉴 닫기 |

**처음 사용 순서**: `[1] 설치` → `[2] 사용` → `[S] 쉬운 시작`.

---

## 🤖 AI 도구 연결 (MCP 설정)

Claude Code · Cursor 에서 NotebookLM 을 쓰려면:

1. 사용 메뉴에서 **`15`** → Enter
2. **`1`**(Claude Code) / **`2`**(Cursor) / **`3`**(JSON 자동) / **`4`**(수동 안내) 중 선택
3. **AI 비서 프로그램을 완전히 껐다가 다시 켜면** 적용됩니다.

**수동 설정용 JSON** (자동이 안 될 때만):

```json
{
  "mcpServers": {
    "notebooklm-mcp": { "command": "notebooklm-mcp" }
  }
}
```

**uvx 방식** (설치 없이 실행):

```json
{
  "mcpServers": {
    "notebooklm-mcp": { "command": "uvx", "args": ["--from", "notebooklm-mcp-cli", "notebooklm-mcp"] }
  }
}
```

**설정 파일 위치**

| 도구 | 설정 파일 경로 |
|---|---|
| Claude Desktop | `%APPDATA%\Claude\claude_desktop_config.json` |
| Cursor | `%USERPROFILE%\.cursor\mcp.json` |
| VS Code | `%USERPROFILE%\.vscode\mcp.json` |
| Gemini CLI | `%USERPROFILE%\.gemini\settings.json` |

---

## ⌨️ 명령어 모음 (참고용)

> 메뉴를 쓰면 직접 입력할 필요는 **없습니다.** RUN 메뉴 `[8]`에서 `nlm` **뒤의 부분만** 입력하면 됩니다.

| 명령어 | 설명 |
|---|---|
| `nlm login` / `nlm login --check` | 구글 로그인 / 로그인 상태 확인 |
| `nlm notebook list` / `nlm notebook create "이름"` | 노트북 목록 / 생성 |
| `nlm notebook query` | 노트북에 질문 |
| `nlm source add` | 자료(URL·텍스트·드라이브·파일) 추가 |
| `nlm studio create` | 오디오·영상 등 콘텐츠 생성 |
| `nlm download <종류>` | 결과물 내려받기 |
| `nlm setup add claude-code\|cursor` | AI 도구 자동 연결 |
| `nlm setup list` / `nlm setup remove <도구>` | 연결 목록 / 연결 해제 |
| `nlm doctor` | 문제 자동 진단 |
| `nlm --ai` / `nlm --version` | AI 모드 / 버전 |
| `notebooklm-mcp` | MCP 서버 실행 (AI 비서용) |

---

## 🔧 환경 변수

- **이 키트 자체는 별도의 환경 변수 설정이 필요 없습니다.** 설치·로그인·연결 모두 메뉴가 자동 처리합니다.
- 관련 항목:
  - **PATH** — 컴퓨터가 `nlm` 명령을 찾는 길. 설치 후 **새 창에서** 자동 인식됩니다(설정 불필요).
  - **인증 데이터 경로** — `%USERPROFILE%\.notebooklm-mcp-cli` (구글 로그인 정보가 저장되는 폴더, **내 PC에만**).
- API 키·토큰 같은 비밀값을 이 키트에 입력하거나 저장하지 않습니다. 구글 로그인은 **브라우저로** 진행됩니다.

---

## 📂 폴더 구조

```
NotebookLM-CLI_One-Click_Kit/
├── 시작하기.bat        ← 메인 진입점 (이것만 더블클릭)
├── INSTALL.bat         ← 설치 스크립트 (시작하기 [1]이 호출)
├── RUN.bat             ← 사용 메뉴 (시작하기 [2]가 호출)
├── UNINSTALL.bat       ← 제거 스크립트 (시작하기 [4]가 호출)
├── README.md           ← 한국어 설명서 (이 파일, GitHub 메인)
├── README.en.md        ← English documentation
├── GUIDE.md            ← 한국어 왕초보 완전 가이드
├── GUIDE.en.md         ← English beginner guide
├── 사용설명서.txt       ← 메모장용 가장 짧은 설명
├── README.pdf / README.en.pdf   ← README PDF 판 (내용 동일)
├── GUIDE.pdf  / GUIDE.en.pdf     ← GUIDE PDF 판 (내용 동일)
├── LICENSE             ← Apache License 2.0 전문
├── NOTICE              ← 저작권 · 제3자 · 상표 고지
├── .gitattributes      ← 줄바꿈 규칙(.bat = CRLF)
└── .gitignore
```

---

## 🏗️ 빌드 · 테스트 · 배포

이 키트는 **컴파일이 필요 없는 Windows 배치 스크립트(.bat) + 문서**로 이뤄져 있습니다.

- **빌드**: 별도 빌드 과정이 **없습니다.** `.bat`와 문서를 그대로 사용합니다.
- **테스트(실행 검증)**: `시작하기.bat` 더블클릭 → `[1] 설치` → `[2] 사용` → `[5] 진단(nlm doctor)`.
  자동화 테스트 스위트는 없으며, **실제 더블클릭 실행으로 검증**합니다.
- **배포(공유 방법)**:
  1. 이 폴더를 **zip/7z로 압축**해 전달하거나,
  2. GitHub에서 **`Code ▸ Download ZIP`** 또는 `git clone` 으로 받습니다.
  - 받은 사람은 압축을 풀고 `시작하기.bat`을 더블클릭하면 됩니다.
- **문서 PDF 재생성**(개발자용, 선택): `pandoc`로 Markdown → HTML, `puppeteer`로 HTML → PDF.
  작업용 임시 폴더 `_build/`는 `.gitignore`로 저장소에서 제외됩니다.

---

## 🛠️ 문제 · 오류 대처

> 💡 **거의 모든 문제는 RUN 메뉴 `[5] 진단하기`(`nlm doctor`)로 원인을 알 수 있습니다.**

| 증상 | 해결 |
|---|---|
| **창이 바로 닫혀요** | `.bat`들이 같은 폴더인지 확인 → 압축 풀기 → 그래도면 `cmd`에서 폴더로 `cd` 후 `시작하기.bat` 실행(글자가 남음) |
| `nlm` 명령이 없다고 나옴 | 아직 설치 전 → `[1] 설치하기` |
| 설치했는데 안 잡힘 | 창 닫고 `시작하기.bat` 다시 → `[2]` (PATH 갱신, 새 창 필요) |
| "Python 을 찾을 수 없습니다" | 파이썬 설치 — 첫 화면 **"Add Python to PATH" 체크** |
| 로그인 창이 안 뜸 / 실패 | 크롬 확인 → `[7] 로그아웃` → `[2] 로그인`, 또는 `[4] 수동 로그인` |
| 버전이 옛날 같음 | `[14] 강제 최신 업데이트` |
| AI 비서에 연결했는데 안 보임 | **AI 비서 프로그램을 완전히 껐다 켜기** |
| 원인 불명 | **`[5] 진단하기`** → 결과 안내 따라가기 |

---

## 🔒 운영 · 보안 주의사항

- **인증 데이터 위치**: `%USERPROFILE%\.notebooklm-mcp-cli` 에 구글 세션 정보가 저장됩니다.
  **공용 PC**에서 쓴 뒤에는 메뉴 `[7] 로그아웃`으로 삭제하세요.
- **MCP 설정 수동 정리**: `UNINSTALL.bat`은 패키지·인증을 지우지만, AI 도구 설정 JSON의 `notebooklm-mcp` 항목은 **직접 확인·삭제**가 필요할 수 있습니다.
- **새 cmd 창**: 설치 직후에는 새 창에서 `nlm` 이 인식됩니다(PATH 갱신).
- **SmartScreen / 안티바이러스**: `.bat` 실행 시 경고가 뜨면 **"추가 정보 → 실행"**(또는 "허용")을 선택하세요. 출처를 신뢰할 때만 실행하세요.
- **.bat 인코딩**: 한국어 Windows(CP949)에 맞춰 저장되어, **GitHub 웹에서는 한글 주석이 깨져 보일 수 있으나 실제 실행은 정상**입니다.
- **민감정보 없음**: 이 키트는 비밀번호·API 키·토큰을 저장하거나 외부로 보내지 않습니다.

---

## 🗑️ 제거(삭제) 방법

1. `시작하기.bat` → **`4`**(제거하기) → Enter
2. 정말 지울 거면 **`yes`** 입력 → Enter
3. 6단계 자동 정리: AI 도구 연결 해제 → 패키지 제거(uv/pip) → 인증 데이터 삭제 → 확인
4. **"[제거 완료]"** 가 나오면 끝.

> ⚠️ **파이썬 자체는 지우지 않습니다**(다른 프로그램이 쓸 수 있으므로 — 의도된 동작).

---

## 📦 기반 패키지

이 툴킷은 아래 오픈소스 패키지를 **래핑(설치·실행)** 합니다 (이 키트에 포함·재배포하지 않고 PyPI 에서 받습니다):

- **[notebooklm-mcp-cli](https://github.com/jacob-bd/notebooklm-mcp-cli)** by jacob-bd — **MIT License** (PyPI: `notebooklm-mcp-cli`, 2026-06 기준 v0.7.6)

---

## ⚖️ 라이선스 · 저작권 · 상업적 용도

### 이 키트 (`.bat` · 문서)

- **라이선스: Apache License 2.0** (전문은 [`LICENSE`](./LICENSE))
- **저작권: Copyright 2026 SoDam AI Studio**
- **상업적 사용 가능.** 단, 배포·재배포 시 Apache-2.0 의 4가지 조건을 지키세요:
  1. `LICENSE` 사본 포함 · 2. `NOTICE` 고지 유지 · 3. 변경 시 변경 표시 · 4. SoDam AI Studio 의 이름·상표를 보증·후원인 것처럼 쓰지 말 것

### 원본 도구 `notebooklm-mcp-cli`

- **라이선스: MIT License** (별도 패키지 — 이 키트의 일부 아님). 이 키트는 **PyPI 에서 내려받기만** 하므로 도구는 **자체 MIT 라이선스**의 적용을 받으며, **원본 저장소의 LICENSE 가 최종 기준**입니다.

### 상표 (Trademarks)

- "NotebookLM", "Google", "Chrome" 은 **Google LLC**, "Claude" 는 **Anthropic**, "Cursor" 는 해당 소유자의 상표입니다.
- 이 키트는 위 회사들과 **제휴·후원·보증 관계가 없는 비공식(unofficial) 도우미**이며, 상표는 식별 목적으로만 사용했습니다.

---

## ⚠️ 면책 고지

- 이 키트는 공개 패키지 `notebooklm-mcp-cli` 를 설치·실행하는 **도우미**일 뿐입니다.
- NotebookLM 은 **Google 의 서비스**이며, 그 이용은 **Google 서비스 약관**의 적용을 받습니다. 자동화 도구 사용 책임은 **사용자 본인**에게 있습니다.
- 이 키트는 **"있는 그대로(AS IS)"** 제공되며 어떤 보증도 하지 않습니다. 데이터 손실·계정 문제 등에 대해 **제작자는 책임지지 않습니다.**
- 구글 로그인 정보는 **내 컴퓨터에만** 저장되며, 이 키트는 시스템 폴더를 임의로 건드리지 않습니다.

---

## 🙋 문의 / 기여

Issues · Pull Requests 를 환영합니다 → [GitHub Issues](https://github.com/sodam-ai/NotebookLM-CLI_One-Click_Kit/issues)

— **Apache-2.0** · Copyright 2026 **SoDam AI Studio**
