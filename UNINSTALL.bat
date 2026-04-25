@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

title NotebookLM MCP CLI - Uninstall
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
cd /d "%SCRIPT_DIR%"

cls
echo.
echo ============================================================
echo   NotebookLM MCP CLI - 안전한 완전 제거  v4
echo ============================================================
echo   제거 항목:
echo    [1] notebooklm-mcp-cli 패키지 (uv / pip)
echo    [2] 레거시 패키지 (notebooklm-cli, notebooklm-mcp-server)
echo    [3] 인증 데이터 (~\.notebooklm-mcp-cli)
echo ============================================================
echo.
echo [WARNING] 이 작업은 되돌릴 수 없습니다!
echo.
set "CONFIRM="
set /p "CONFIRM= 정말 완전 제거하시겠습니까? (yes 입력): "
if /i "!CONFIRM!" NEQ "yes" ( echo  취소됨. & pause & exit /b 0 )
echo.
echo ------------------------------------------------------------
echo.
echo [1/5] 현재 설치 상태...
nlm --version >nul 2>&1
if %ERRORLEVEL% EQU 0 ( for /f "delims=" %%v in ('nlm --version 2^>^&1') do echo  현재 버전: %%v
) else ( echo  nlm 명령 없음 )
echo.
echo [2/5] uv 로 제거 시도...
uv --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 ( echo [SKIP] uv 없음 & goto :PIP_REMOVE )
uv tool uninstall notebooklm-mcp-cli >nul 2>&1
if %ERRORLEVEL% EQU 0 ( echo [OK]  uv: notebooklm-mcp-cli 제거
) else ( echo [INFO] uv: notebooklm-mcp-cli 없거나 이미 제거됨 )
uv tool uninstall notebooklm-cli >nul 2>&1
if %ERRORLEVEL% EQU 0 echo [OK]  uv: notebooklm-cli (레거시) 제거
uv tool uninstall notebooklm-mcp-server >nul 2>&1
if %ERRORLEVEL% EQU 0 echo [OK]  uv: notebooklm-mcp-server (레거시) 제거

:PIP_REMOVE
echo.
echo [3/5] pip 로 제거 시도...
call :FIND_PYTHON >nul 2>&1
if not defined PYTHON ( echo [SKIP] python 없음 & goto :DATA_REMOVE )
"%PYTHON%" -m pip uninstall notebooklm-mcp-cli -y >nul 2>&1
if %ERRORLEVEL% EQU 0 ( echo [OK]  pip: notebooklm-mcp-cli 제거
) else ( echo [INFO] pip: notebooklm-mcp-cli 없거나 이미 제거됨 )
"%PYTHON%" -m pip uninstall notebooklm-cli -y >nul 2>&1
if %ERRORLEVEL% EQU 0 echo [OK]  pip: notebooklm-cli (레거시) 제거
"%PYTHON%" -m pip uninstall notebooklm-mcp-server -y >nul 2>&1
if %ERRORLEVEL% EQU 0 echo [OK]  pip: notebooklm-mcp-server (레거시) 제거

:DATA_REMOVE
echo.
echo [4/5] 인증 데이터 삭제 중...
set "AUTH_DIR=%USERPROFILE%\.notebooklm-mcp-cli"
if exist "!AUTH_DIR!" (
    rmdir /s /q "!AUTH_DIR!" 2>nul
    if !ERRORLEVEL! EQU 0 ( echo [OK]  삭제 완료: !AUTH_DIR!
    ) else ( echo [WARNING] 삭제 실패. 수동 삭제: !AUTH_DIR! )
) else ( echo [SKIP] 인증 데이터 없음 )

echo.
echo [5/5] 제거 검증...
nlm --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 ( echo [OK]  nlm 제거 확인
) else ( echo [INFO] nlm 이 아직 PATH 에 있음. 새 터미널 열면 사라집니다. )
notebooklm-mcp --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 ( echo [OK]  notebooklm-mcp 제거 확인
) else ( echo [INFO] notebooklm-mcp 이 아직 PATH 에 있음. 새 터미널에서 해결됩니다. )
if not exist "!AUTH_DIR!" echo [OK]  인증 데이터 없음 확인
echo.
echo ============================================================
echo   [완전 제거 완료]  UNINSTALL COMPLETE
echo ============================================================
echo.
echo   MCP 설정 파일에서도 수동으로 제거해주세요:
echo    Claude Desktop : %APPDATA%\Claude\claude_desktop_config.json
echo    Cursor         : %USERPROFILE%\.cursor\mcp.json
echo    VS Code        : %USERPROFILE%\.vscode\mcp.json
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
