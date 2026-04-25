@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

title NotebookLM MCP CLI - Installation
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
cd /d "%SCRIPT_DIR%"

cls
echo.
echo ============================================================
echo   NotebookLM MCP CLI - One-Click Installer  v4
echo   GitHub : jacob-bd/notebooklm-mcp-cli
echo   PyPI   : notebooklm-mcp-cli
echo ============================================================
echo.

REM --------------------------------------------------------
REM [1/5] Python 탐지 (4단계 방어, 실제 exe 경로 추출)
REM --------------------------------------------------------
echo [1/5] Python 확인 중...
call :FIND_PYTHON
if %ERRORLEVEL% NEQ 0 exit /b 2
for /f "delims=" %%v in ('"%PYTHON%" --version 2^>^&1') do set "PY_VER=%%v"
echo [OK]  !PY_VER!
echo       경로: !PYTHON!

REM --------------------------------------------------------
REM [2/5] pip 확인 (--user 환경 포함)
REM --------------------------------------------------------
echo.
echo [2/5] pip 확인 중...
"!PYTHON!" -m pip --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%v in ('"%PYTHON%" -m pip --version 2^>^&1') do echo [OK]  %%v
    goto :PIP_OK
)
REM pip 없으면 ensurepip 으로 설치 시도
echo [INFO] pip 없음. ensurepip 으로 설치 시도...
"!PYTHON!" -m ensurepip --upgrade >nul 2>&1
"!PYTHON!" -m pip --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    for /f "delims=" %%v in ('"%PYTHON%" -m pip --version 2^>^&1') do echo [OK]  %%v
    goto :PIP_OK
)
echo [ERROR] pip 설치에 실패했습니다.
echo [TIP]   Python 을 재설치하거나 관리자 권한으로 실행해보세요.
pause
exit /b 2
:PIP_OK

REM --------------------------------------------------------
REM [3/5] uv 확인 및 설치
REM --------------------------------------------------------
echo.
echo [3/5] uv 확인 중...
set "UV_CMD="
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "UV_CMD=uv"
    for /f "delims=" %%v in ('uv --version 2^>^&1') do echo [OK]  uv %%v
    goto :UV_READY
)
for %%P in (
    "%USERPROFILE%\.cargo\bin\uv.exe"
    "%APPDATA%\Python\Scripts\uv.exe"
    "%LOCALAPPDATA%\Programs\Python\Scripts\uv.exe"
) do (
    if exist %%P ( set "UV_CMD=%%~P" & echo [OK]  uv: %%~P & goto :UV_READY )
)
echo [INFO] uv 없음. pip 로 설치합니다...
"!PYTHON!" -m pip install uv --quiet --user
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] uv 설치 실패. pip 방식으로 전환합니다.
    set "USE_PIP_ONLY=1" & goto :DO_INSTALL
)
uv --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( set "UV_CMD=uv" & echo [OK]  uv 설치 완료 & goto :UV_READY )
for %%P in (
    "%APPDATA%\Python\Scripts\uv.exe"
    "%APPDATA%\Python\Python313\Scripts\uv.exe"
    "%APPDATA%\Python\Python312\Scripts\uv.exe"
    "%APPDATA%\Python\Python311\Scripts\uv.exe"
    "%APPDATA%\Python\Python310\Scripts\uv.exe"
) do (
    if exist %%P ( set "UV_CMD=%%~P" & echo [OK]  uv: %%~P & goto :UV_READY )
)
echo [WARNING] uv 경로 탐색 실패. pip 방식으로 전환합니다.
set "USE_PIP_ONLY=1" & goto :DO_INSTALL
:UV_READY
set "USE_PIP_ONLY=0"

REM --------------------------------------------------------
REM [4/5] notebooklm-mcp-cli 설치
REM --------------------------------------------------------
:DO_INSTALL
echo.
echo [4/5] notebooklm-mcp-cli 설치 중...
echo       (PyPI 에서 최신 버전 다운로드. 잠시 기다려주세요...)
echo.
if "!USE_PIP_ONLY!"=="1" (
    echo [INFO] pip 방식으로 설치합니다...
    "!PYTHON!" -m pip install notebooklm-mcp-cli --user
    if !ERRORLEVEL! NEQ 0 (
        echo [ERROR] pip 설치 실패! 인터넷 연결 확인 후 재시도하세요.
        pause & exit /b 3
    )
    echo [OK]  pip 설치 완료 & goto :VERIFY
)
"!UV_CMD!" tool install notebooklm-mcp-cli
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] uv 설치 실패. pip 로 재시도합니다...
    "!PYTHON!" -m pip install notebooklm-mcp-cli --user
    if !ERRORLEVEL! NEQ 0 ( echo [ERROR] 설치 실패! & pause & exit /b 3 )
    echo [OK]  pip 설치 완료 (fallback) & goto :VERIFY
)
echo [OK]  uv tool install 완료

REM --------------------------------------------------------
REM [5/5] 설치 검증
REM --------------------------------------------------------
:VERIFY
echo.
echo [5/5] 설치 검증 중...
timeout /t 2 >nul
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%v in ('nlm --version 2^>^&1') do echo [OK]  nlm: %%v
) else (
    echo [WARNING] nlm 이 아직 PATH 에 없습니다.
    echo           새 cmd 창을 열면 정상 동작합니다.
)
echo.
echo ============================================================
echo   [설치 완료]  INSTALLATION COMPLETE
echo ============================================================
echo.
echo   다음 단계:
echo    1. 이 창을 닫고 새 cmd 창을 엽니다
echo    2. RUN.bat 실행
echo    3. 메뉴 [2번] Google 로그인
echo    4. 메뉴 [1번] MCP 서버 시작
echo.
echo   MCP 설정 (Claude Desktop / Cursor / VS Code):
echo   +-------------------------------------------------+
echo   ^| {                                               ^|
echo   ^|   "mcpServers": {                               ^|
echo   ^|     "notebooklm-mcp": {                        ^|
echo   ^|       "command": "notebooklm-mcp"              ^|
echo   ^|     }                                           ^|
echo   ^|   }                                             ^|
echo   ^| }                                               ^|
echo   +-------------------------------------------------+
echo.
pause
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

REM -- 모든 단계 실패 --
echo.
echo [ERROR] Python 을 찾을 수 없습니다!
echo         확인 방법:
echo          1. 새 cmd 창에서  py --version  입력
echo          2. https://www.python.org/downloads/ 에서 재설치
echo          3. 설치 시 "Add Python to PATH" 반드시 체크
echo.
goto :FP_FAIL

:FP_DONE
goto :EOF

:FP_FAIL
pause
exit /b 2
