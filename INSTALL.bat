@echo off
chcp 949 >nul
setlocal EnableDelayedExpansion

title NotebookLM MCP CLI - 설치 (Installation)
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
cd /d "%SCRIPT_DIR%"

cls
echo.
echo ============================================================
echo   NotebookLM MCP CLI - 원클릭 설치  v5
echo   GitHub : jacob-bd/notebooklm-mcp-cli
echo   PyPI   : notebooklm-mcp-cli
echo ============================================================
echo.
echo   [이 프로그램이 하는 일]
echo    구글 NotebookLM 을 컴퓨터 명령(nlm)과
echo    AI 비서(Claude/Cursor 등)에서 쓸 수 있게 설치합니다.
echo.
echo   [설치 전 준비물 3가지]
echo    1) 인터넷 연결
echo    2) 구글 계정 (로그인에 필요)
echo    3) 크롬(Chrome) 브라우저 (자동 로그인에 필요)
echo.
echo   * 파이썬(Python)이 없으면 아래에서 안내해 드립니다.
echo.
echo   준비되셨으면 아무 키나 누르세요. (그만두려면 이 창을 닫으세요)
pause >nul
cls

REM --------------------------------------------------------
REM [1/6] 인터넷 연결 확인 (없으면 설치 다운로드가 실패함)
REM --------------------------------------------------------
echo [1/6] 인터넷 연결 확인 중...
ping -n 1 pypi.org >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK]  인터넷 연결 정상
) else (
    echo [주의] 인터넷이 잡히지 않는 것 같습니다.
    echo        ( 보안 프로그램이 막아 잘못 뜰 수도 있습니다 )
    echo        와이파이/랜선을 확인하고, 계속하려면 아무 키나 누르세요.
    pause >nul
)

REM --------------------------------------------------------
REM [2/6] Python 탐지 (4단계 방어, 실제 exe 경로 추출)
REM --------------------------------------------------------
echo.
echo [2/6] Python 확인 중...
call :FIND_PYTHON
if %ERRORLEVEL% NEQ 0 exit /b 2
for /f "delims=" %%v in ('"%PYTHON%" --version 2^>^&1') do set "PY_VER=%%v"
echo [OK]  !PY_VER!
echo       경로: !PYTHON!

REM --------------------------------------------------------
REM [3/6] pip 확인 (--user 환경 포함)
REM --------------------------------------------------------
echo.
echo [3/6] pip 확인 중...
"!PYTHON!" -m pip --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%v in ('"%PYTHON%" -m pip --version 2^>^&1') do echo [OK]  %%v
    goto :PIP_OK
)
REM pip 없으면 ensurepip 으로 설치 시도
echo [INFO] pip 없음. ensurepip 으로 설치 시도...
"!PYTHON!" -m ensurepip --upgrade >nul 2>&1
"!PYTHON!" -m pip --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%v in ('"%PYTHON%" -m pip --version 2^>^&1') do echo [OK]  %%v
    goto :PIP_OK
)
echo [ERROR] pip 설치에 실패했습니다.
echo [TIP]   Python 을 재설치하거나 관리자 권한으로 실행해보세요.
pause
exit /b 2
:PIP_OK

REM --------------------------------------------------------
REM [4/6] uv 확인 및 설치
REM --------------------------------------------------------
echo.
echo [4/6] uv 확인 중...
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
REM [5/6] notebooklm-mcp-cli 설치
REM --------------------------------------------------------
:DO_INSTALL
echo.
echo [5/6] notebooklm-mcp-cli 설치 중...
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
REM [6/6] 설치 검증
REM --------------------------------------------------------
:VERIFY
echo.
echo [6/6] 설치 검증 중...
timeout /t 2 >nul
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    for /f "delims=" %%v in ('nlm --version 2^>^&1') do echo [OK]  nlm: %%v
) else (
    echo [참고] nlm 명령이 아직 이 창에선 안 잡힐 수 있습니다.
    echo        설치는 됐고, RUN.bat 을 새로 실행하면 정상 동작합니다.
)
echo.
echo ============================================================
echo   [설치 완료]  INSTALLATION COMPLETE
echo ============================================================
echo.
echo   이제 무엇을 하면 되나요?  (순서대로 따라하세요)
echo    1. RUN.bat 파일을 더블클릭하세요  (이 창은 닫아도 됩니다)
echo    2. 메뉴에서  [S] 쉬운 시작  을 고르면 차근차근 안내합니다
echo       (또는 [2]로 구글 로그인 -^> [1]로 서버 시작)
echo.
echo   AI 비서(Claude/Cursor)에 연결하려면?
echo    RUN.bat 메뉴 [15] 에서 "자동 연결" 을 고르면 됩니다.
echo    (어려운 설정 파일을 직접 건드릴 필요 없습니다)
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
echo         파이썬은 이 프로그램이 돌아가는 데 꼭 필요합니다.
echo         설치 방법:
echo          1. https://www.python.org/downloads/ 접속
echo          2. 노란 "Download Python" 버튼 클릭 후 설치
echo          3. 설치 첫 화면 "Add Python to PATH" 를 반드시 체크!
echo          4. 설치 후 이 INSTALL.bat 을 다시 실행하세요
echo.
goto :FP_FAIL

:FP_DONE
goto :EOF

:FP_FAIL
pause
exit /b 2
