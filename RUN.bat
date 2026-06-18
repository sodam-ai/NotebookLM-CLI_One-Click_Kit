@echo off
chcp 949 >nul
setlocal EnableDelayedExpansion

title NotebookLM MCP CLI - 메뉴 (Menu)
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
cd /d "%SCRIPT_DIR%"

set "NLM_OK=0"
set "MCP_OK=0"
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 set "NLM_OK=1"
notebooklm-mcp --version >nul 2>&1
if %ERRORLEVEL% EQU 0 set "MCP_OK=1"

:MAIN_MENU
cls
echo.
echo ============================================================
echo   NotebookLM MCP CLI - 메인 메뉴  v5
if "!NLM_OK!"=="0" (
echo   [!] 아직 설치가 안 됐습니다 -- 먼저 INSTALL.bat 을 실행하세요
)
echo ============================================================
echo.
echo    처음 오셨나요?   ==^>   S.  쉬운 시작 (차근차근 안내)
echo.
echo   -- 자주 쓰는 기능 --
echo    1. MCP 서버 시작 (AI 비서에 연결해 사용)
echo    2. 구글 로그인 (크롬 자동)
echo    3. 로그인 됐는지 확인
echo    9. 내 노트북 목록 보기
echo   10. 새 노트북 만들기
echo.
echo   -- AI 비서에 연결 (MCP) --
echo   15. AI 도구에 자동 연결 (Claude Code / Cursor)
echo.
echo   -- 인증(로그인) 관리 --
echo    4. 수동 로그인 (쿠키 파일)
echo    6. 프로필(계정) 목록 보기
echo    7. 로그아웃 / 인증 데이터 삭제
echo.
echo   -- 명령 / 도움말 --
echo    8. nlm 명령 직접 입력
echo   11. AI 도움말 (nlm --ai)
echo    T. 쉬운 용어 풀이 (MCP, pip 등이 뭔가요?)
echo.
echo   -- 문제 해결 / 버전 --
echo    5. 진단하기 (안 될 때 - nlm doctor)
echo   12. 현재 버전 확인
echo   13. 업데이트
echo   14. 강제 최신 업데이트
echo   16. 설치 경로 / 환경 정보
echo.
echo    0. 종료
echo.
echo ============================================================
echo.
set "CHOICE="
set /p "CHOICE= 번호(또는 S, T)를 입력하세요: "
if /i "!CHOICE!"=="S"  goto :EASY_START
if /i "!CHOICE!"=="T"  goto :GLOSSARY
if "!CHOICE!"=="0"  goto :EXIT
if "!CHOICE!"=="1"  goto :START_MCP
if "!CHOICE!"=="2"  goto :LOGIN_AUTO
if "!CHOICE!"=="3"  goto :LOGIN_CHECK
if "!CHOICE!"=="4"  goto :LOGIN_MANUAL
if "!CHOICE!"=="5"  goto :DOCTOR
if "!CHOICE!"=="6"  goto :PROFILE_LIST
if "!CHOICE!"=="7"  goto :LOGOUT
if "!CHOICE!"=="8"  goto :NLM_CLI
if "!CHOICE!"=="9"  goto :NOTEBOOK_LIST
if "!CHOICE!"=="10" goto :NOTEBOOK_CREATE
if "!CHOICE!"=="11" goto :NLM_AI
if "!CHOICE!"=="12" goto :VERSION_CHECK
if "!CHOICE!"=="13" goto :UPDATE_NORMAL
if "!CHOICE!"=="14" goto :UPDATE_FORCE
if "!CHOICE!"=="15" goto :MCP_CONFIG
if "!CHOICE!"=="16" goto :ENV_INFO
echo [참고] 잘못 입력하셨습니다. 화면의 번호나 S, T 중에서 골라주세요.
timeout /t 2 >nul
goto :MAIN_MENU

REM ============================================================
REM  [S] 쉬운 시작 -- 처음 쓰는 사람을 위한 3단계 안내
REM ============================================================
:EASY_START
cls
echo.
echo ==== [쉬운 시작] 처음이라면 이대로 따라오세요 ============
echo.
echo  이 프로그램은 구글 "NotebookLM"(내 자료로 공부/요약해주는 AI)을
echo  컴퓨터 명령과 AI 비서(Claude/Cursor)에서 쓰게 해줍니다.
echo.
if "!NLM_OK!"=="0" (
    echo  [멈춤] 아직 설치가 안 됐습니다.
    echo         이 창을 닫고 INSTALL.bat 을 먼저 더블클릭해 주세요.
    echo.
    pause & goto :MAIN_MENU
)
echo  -- 1단계: 구글 로그인 되어 있는지 확인 --
echo.
nlm login --check
echo.
echo  위에 "로그인 됨/authenticated" 같은 표시가 없으면 로그인이 필요합니다.
set "GO="
set /p "GO= 지금 구글 로그인을 할까요? (y = 예 / Enter = 건너뛰기): "
if /i "!GO!"=="y" (
    echo.
    echo  크롬 창이 열리면 평소처럼 구글 계정으로 로그인하세요.
    nlm login
)
echo.
echo  -- 2단계: AI 비서에 연결 (선택) --
echo.
echo  Claude Code 나 Cursor 를 쓰신다면 자동으로 연결할 수 있습니다.
set "GO2="
set /p "GO2= 지금 연결할까요? (1 = Claude Code / 2 = Cursor / Enter = 나중에): "
if "!GO2!"=="1" nlm setup add claude-code
if "!GO2!"=="2" nlm setup add cursor
echo.
echo  -- 3단계: 첫 노트북 만들어보기 (선택) --
echo.
set "GO3="
set /p "GO3= 연습용 노트북을 만들어볼까요? 이름 입력 (Enter = 건너뛰기): "
if not "!GO3!"=="" nlm notebook create "!GO3!"
echo.
echo  ====== 준비 끝! ======
echo  이제 메뉴 [1] MCP 서버 시작, [9] 노트북 목록 등을 자유롭게 쓰세요.
echo.
pause
goto :MAIN_MENU

REM ============================================================
REM  [T] 용어 풀이 -- 어려운 말 쉽게
REM ============================================================
:GLOSSARY
cls
echo.
echo ==== [쉬운 용어 풀이] ====================================
echo.
echo   NotebookLM : 내가 올린 자료(문서/링크)를 읽고 요약/답변해주는
echo                구글의 AI 노트.
echo.
echo   nlm        : 위 NotebookLM 을 컴퓨터에서 명령으로 다루는 도구.
echo                (예: nlm notebook list = 내 노트북 목록 보기)
echo.
echo   MCP        : AI 비서(Claude/Cursor)에게 이 도구를 연결해주는 "다리".
echo                연결하면 AI가 직접 내 NotebookLM 을 쓸 수 있습니다.
echo.
echo   서버       : 메뉴 [1] 로 켜두면 AI 비서가 접속하는 "전화선".
echo                끄려면 그 창에서 Ctrl+C.
echo.
echo   Python/pip : 이 도구가 돌아가는 데 필요한 바탕 프로그램(엔진)과
echo                그 부품을 받아오는 설치 도우미. 설치는 자동입니다.
echo.
echo   uv         : pip 보다 빠른 최신 설치 도우미. 자동으로 씁니다.
echo.
echo   로그인/쿠키 : 구글 계정 인증 정보. 한 번 로그인하면 저장됩니다.
echo   프로필      : 계정이 여러 개일 때 구분하는 이름표.
echo.
echo   PATH       : 컴퓨터가 명령(nlm)을 찾는 길. 설치 후 새 창에서 잡힘.
echo.
pause
goto :MAIN_MENU

:START_MCP
cls
echo.
echo ---- [1] MCP 서버 시작 ------------------------------------
echo.
if "!MCP_OK!"=="0" (
    echo [ERROR] notebooklm-mcp 없음. INSTALL.bat 를 먼저 실행하세요.
    pause & goto :MAIN_MENU
)
echo  MCP 서버를 시작합니다.
echo  - 이 창은 켜둔 채로 두면 AI 비서가 접속합니다.
echo  - 끄려면 이 창에서  Ctrl+C  를 누르세요.
echo  -----------------------------------------------------------
notebooklm-mcp
echo  -----------------------------------------------------------
echo.
echo  MCP 서버가 종료되었습니다.
pause
goto :MAIN_MENU

:LOGIN_AUTO
cls
echo.
echo ---- [2] 구글 로그인 (크롬 자동) --------------------------
echo.
echo  크롬 브라우저가 열리면 평소처럼 구글 계정으로 로그인하세요.
echo  계정이 여러 개면 프로필명을 입력하세요. (하나면 그냥 Enter)
set "PROFILE="
set /p "PROFILE= 프로필명 (Enter=기본): "
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
if "!PROFILE!"=="" ( nlm login ) else ( nlm login --profile "!PROFILE!" )
echo.
pause
goto :MAIN_MENU

:LOGIN_CHECK
cls
echo.
echo ---- [3] 로그인 상태 확인 ---------------------------------
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
nlm login --check
echo.
pause
goto :MAIN_MENU

:LOGIN_MANUAL
cls
echo.
echo ---- [4] 수동 로그인 (쿠키 파일) -------------------------
echo.
echo  자동 로그인이 안 될 때만 쓰세요. 쿠키 파일이 필요합니다.
echo  예: %USERPROFILE%\Downloads\cookies.txt
echo.
set "COOKIE_FILE="
set /p "COOKIE_FILE= 쿠키 파일 경로: "
if "!COOKIE_FILE!"=="" ( echo [참고] 입력이 없어 취소합니다. & pause & goto :MAIN_MENU )
if not exist "!COOKIE_FILE!" ( echo [ERROR] 그 위치에 파일이 없습니다: !COOKIE_FILE! & pause & goto :MAIN_MENU )
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
nlm login --manual --file "!COOKIE_FILE!"
echo.
pause
goto :MAIN_MENU

:DOCTOR
cls
echo.
echo ---- [5] 진단하기 (nlm doctor) ----------------------------
echo.
echo  뭔가 잘 안 될 때 누르세요. 설치/로그인 문제를 자동 점검합니다.
echo  -----------------------------------------------------------
if "!NLM_OK!"=="0" (
    echo [ERROR] nlm 명령이 없습니다 = 아직 설치가 안 됐다는 뜻입니다.
    echo         이 창을 닫고 INSTALL.bat 을 먼저 실행하세요.
    pause & goto :MAIN_MENU
)
nlm doctor
echo  -----------------------------------------------------------
echo.
echo  [도움말] 위 결과에서 빨간 X 나 FAIL 이 있으면:
echo   - 로그인 문제면  메뉴 [2] 로 다시 로그인
echo   - 버전 문제면    메뉴 [14] 강제 최신 업데이트
echo   - 그래도 안 되면 메뉴 [7] 로그아웃 후 [2] 재로그인
echo.
pause
goto :MAIN_MENU

:PROFILE_LIST
cls
echo.
echo ---- [6] 프로필(계정) 목록 --------------------------------
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
nlm login profile list
echo.
pause
goto :MAIN_MENU

:LOGOUT
cls
echo.
echo ---- [7] 로그아웃 / 인증 데이터 삭제 ---------------------
echo.
echo [주의] 저장된 구글 로그인 정보(쿠키)를 모두 지웁니다.
echo        다시 쓰려면 메뉴 [2] 에서 재로그인해야 합니다.
echo.
set "CONFIRM="
set /p "CONFIRM= 정말 지울까요? 지우려면  yes  를 입력: "
if /i "!CONFIRM!" NEQ "yes" ( echo  취소했습니다. & pause & goto :MAIN_MENU )
set "AUTH_DIR=%USERPROFILE%\.notebooklm-mcp-cli"
if exist "!AUTH_DIR!" (
    rmdir /s /q "!AUTH_DIR!" 2>nul
    if !ERRORLEVEL! EQU 0 ( echo [OK]  삭제 완료: !AUTH_DIR!
    ) else ( echo [WARNING] 삭제 실패. 수동 삭제: !AUTH_DIR! )
) else ( echo [INFO] 지울 인증 데이터가 없습니다. )
echo.
echo  재사용하려면 메뉴 [2번] 에서 다시 로그인하세요.
pause
goto :MAIN_MENU

:NLM_CLI
cls
echo.
echo ---- [8] nlm 명령 직접 실행 -------------------------------
echo.
echo  nlm 뒤에 올 말만 입력하세요. (아는 사람용)
echo  예: notebook list  /  notebook create "이름"  /  --help  /  --ai
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
set "NLM_ARGS="
set /p "NLM_ARGS= nlm 뒤에 올 명령 (Enter=--help): "
if "!NLM_ARGS!"=="" ( nlm --help ) else ( nlm !NLM_ARGS! )
echo.
pause
goto :MAIN_MENU

:NOTEBOOK_LIST
cls
echo.
echo ---- [9] 내 노트북 목록 ------------------------------------
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
nlm notebook list
echo.
pause
goto :MAIN_MENU

:NOTEBOOK_CREATE
cls
echo.
echo ---- [10] 새 노트북 만들기 --------------------------------
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
set "NB_NAME="
set /p "NB_NAME= 새 노트북 이름: "
if "!NB_NAME!"=="" ( echo [참고] 이름이 없어 취소합니다. & pause & goto :MAIN_MENU )
nlm notebook create "!NB_NAME!"
echo.
pause
goto :MAIN_MENU

:NLM_AI
cls
echo.
echo ---- [11] AI 도움말 (nlm --ai) ----------------------------
echo.
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
nlm --ai
echo.
pause
goto :MAIN_MENU

:VERSION_CHECK
cls
echo.
echo ---- [12] 버전 확인 ----------------------------------------
echo.
echo  -- 설치된 버전 --
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( for /f "delims=" %%v in ('nlm --version 2^>^&1') do echo  nlm   : %%v
) else ( echo  nlm   : 명령 없음 )
echo.
echo  -- uv 도구 목록 --
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( uv tool list 2>nul | findstr /i "notebooklm"
) else ( echo  uv 없음 )
echo.
echo  -- pip 패키지 정보 --
call :FIND_PYTHON >nul 2>&1
if defined PYTHON ( "%PYTHON%" -m pip show notebooklm-mcp-cli 2>nul | findstr /i "Name Version" )
echo.
pause
goto :MAIN_MENU

:UPDATE_NORMAL
cls
echo.
echo ---- [13] 업데이트 (uv tool upgrade) ----------------------
echo.
echo [참고] 버전 제약으로 최신이 안 받아질 수 있습니다.
echo        그럴 땐 메뉴 [14] 강제 최신 업데이트를 쓰세요.
echo.
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( uv tool upgrade notebooklm-mcp-cli & goto :UPD1_DONE )
call :FIND_PYTHON >nul 2>&1
if defined PYTHON ( "%PYTHON%" -m pip install --upgrade notebooklm-mcp-cli )
:UPD1_DONE
echo.
echo  완료. 버전 확인: 메뉴 [12번]
pause
goto :MAIN_MENU

:UPDATE_FORCE
cls
echo.
echo ---- [14] 강제 최신 업데이트 (--force) --------------------
echo.
echo  PyPI 의 가장 최신 버전으로 강제로 다시 설치합니다.
echo.
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( uv tool install --force notebooklm-mcp-cli & goto :UPD2_DONE )
call :FIND_PYTHON >nul 2>&1
if defined PYTHON ( "%PYTHON%" -m pip install --upgrade --force-reinstall notebooklm-mcp-cli )
:UPD2_DONE
echo.
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 for /f "delims=" %%v in ('nlm --version 2^>^&1') do echo [OK]  버전: %%v
echo.
pause
goto :MAIN_MENU

:MCP_CONFIG
cls
echo.
echo ---- [15] AI 도구에 연결 (MCP) ----------------------------
echo.
echo  어디에 연결할까요?
echo    1. Claude Code 에 자동 연결   (권장)
echo    2. Cursor 에 자동 연결        (권장)
echo    3. 설정 JSON 파일 자동 생성
echo    4. 수동 설정 (JSON 직접 복사 - Claude Desktop/VS Code/Gemini)
echo    0. 뒤로
echo.
set "MSEL="
set /p "MSEL= 번호 선택: "
if "!MSEL!"=="0" goto :MAIN_MENU
if "!MSEL!"=="1" goto :MCP_CLAUDE
if "!MSEL!"=="2" goto :MCP_CURSOR
if "!MSEL!"=="3" goto :MCP_JSON
if "!MSEL!"=="4" goto :MCP_MANUAL
echo [참고] 잘못 입력했습니다.
timeout /t 2 >nul
goto :MCP_CONFIG

:MCP_CLAUDE
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
echo.
nlm setup add claude-code
echo.
echo [OK]  연결을 시도했습니다. Claude Code 를 껐다 켜면 적용됩니다.
pause
goto :MAIN_MENU

:MCP_CURSOR
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
echo.
nlm setup add cursor
echo.
echo [OK]  연결을 시도했습니다. Cursor 를 껐다 켜면 적용됩니다.
pause
goto :MAIN_MENU

:MCP_JSON
if "!NLM_OK!"=="0" ( echo [ERROR] nlm 없음. INSTALL.bat 먼저 실행. & pause & goto :MAIN_MENU )
echo.
nlm setup add json
echo.
pause
goto :MAIN_MENU

:MCP_MANUAL
cls
echo.
echo ---- [15-수동] 설정 JSON 직접 복사 ------------------------
echo.
echo  -- 기본 방식 (설치 후 권장) --
echo  {
echo    "mcpServers": {
echo      "notebooklm-mcp": {
echo        "command": "notebooklm-mcp"
echo      }
echo    }
echo  }
echo.
echo  -- uvx 방식 (설치 없이 실행) --
echo  {
echo    "mcpServers": {
echo      "notebooklm-mcp": {
echo        "command": "uvx",
echo        "args": ["--from", "notebooklm-mcp-cli", "notebooklm-mcp"]
echo      }
echo    }
echo  }
echo.
echo  -- 설정 파일 위치 --
echo   Claude Desktop : %APPDATA%\Claude\claude_desktop_config.json
echo   Cursor         : %USERPROFILE%\.cursor\mcp.json
echo   VS Code        : %USERPROFILE%\.vscode\mcp.json
echo   Gemini CLI     : %USERPROFILE%\.gemini\settings.json
echo.
echo  -- 명령줄 등록 --
echo   claude mcp add --scope user notebooklm-mcp notebooklm-mcp
echo   gemini mcp add --scope user notebooklm-mcp notebooklm-mcp
echo.
pause
goto :MAIN_MENU

:ENV_INFO
cls
echo.
echo ---- [16] 설치 경로 / 환경 정보 ---------------------------
echo.
echo  -- 실행 파일 경로 --
for /f "delims=" %%p in ('where nlm 2^>nul') do              echo  nlm            : %%p
for /f "delims=" %%p in ('where notebooklm-mcp 2^>nul') do   echo  notebooklm-mcp : %%p
echo.
echo  -- 인증 데이터 --
echo  %USERPROFILE%\.notebooklm-mcp-cli
if exist "%USERPROFILE%\.notebooklm-mcp-cli" ( echo  [존재함] & dir /b "%USERPROFILE%\.notebooklm-mcp-cli" 2>nul
) else ( echo  [없음 - 로그인 전] )
echo.
echo  -- Python 탐지 결과 --
call :FIND_PYTHON >nul 2>&1
if defined PYTHON ( echo  Python : !PYTHON! ) else ( echo  Python : 탐지 실패 )
echo.
echo  -- 런타임 버전 --
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 for /f "delims=" %%v in ('uv --version 2^>^&1') do echo  uv     : %%v
echo.
echo  -- 현재 스크립트 --
echo  %SCRIPT_DIR%
echo.
pause
goto :MAIN_MENU

:EXIT
echo.
echo  종료합니다. 안녕히 가세요!
echo.
exit /b 0

REM ============================================================
REM  :FIND_PYTHON  v4 -- 실제 python.exe 절대경로를 PYTHON 에 저장
REM ============================================================
:FIND_PYTHON
set "PYTHON="

REM [단계1] py 런처 -> sys.executable 로 실제 경로 추출
py -3 --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 goto :FP_STEP2
for /f "usebackq delims=" %%P in (`py -3 -c "import sys;print(sys.executable)" 2^>nul`) do (
    if exist "%%P" ( set "PYTHON=%%P" & goto :FP_DONE )
)

:FP_STEP2
REM [단계2] where python -> WindowsApps 스텁 제외
for /f "usebackq delims=" %%P in (`where python 2^>nul`) do (
    echo %%P | findstr /i "WindowsApps" >nul 2>&1
    if !ERRORLEVEL! NEQ 0 (
        if exist "%%P" ( set "PYTHON=%%P" & goto :FP_DONE )
    )
)
for /f "usebackq delims=" %%P in (`where python3 2^>nul`) do (
    echo %%P | findstr /i "WindowsApps" >nul 2>&1
    if !ERRORLEVEL! NEQ 0 (
        if exist "%%P" ( set "PYTHON=%%P" & goto :FP_DONE )
    )
)

REM [단계3] 표준 설치 경로 직접 탐색 (3.10~3.13)
for %%V in (313 312 311 310) do (
    for %%D in (
        "%LOCALAPPDATA%\Programs\Python\Python%%V\python.exe"
        "%PROGRAMFILES%\Python%%V\python.exe"
        "%PROGRAMFILES(X86)%\Python%%V\python.exe"
        "%USERPROFILE%\AppData\Local\Programs\Python\Python%%V\python.exe"
    ) do (
        if exist %%D ( set "PYTHON=%%~D" & goto :FP_DONE )
    )
)

REM [단계4] Anaconda / Miniconda
for %%D in (
    "%USERPROFILE%\anaconda3\python.exe"
    "%USERPROFILE%\miniconda3\python.exe"
    "%PROGRAMDATA%\anaconda3\python.exe"
    "%PROGRAMDATA%\miniconda3\python.exe"
) do (
    if exist %%D ( set "PYTHON=%%~D" & goto :FP_DONE )
)

:FP_DONE
goto :EOF
