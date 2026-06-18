@echo off
chcp 949 >nul
setlocal EnableDelayedExpansion

title NotebookLM 키트 - 시작하기
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
cd /d "%SCRIPT_DIR%"

:HOME
cls
echo.
echo ============================================================
echo            NotebookLM 키트 - 여기서 시작하세요
echo ============================================================
echo.
echo   이 키트는 구글 "NotebookLM"(내 자료를 읽고 요약/답변해주는
echo   AI 노트)을 컴퓨터와 AI 비서에서 쓰게 해줍니다.
echo.
echo   무엇을 하시겠어요?  처음이라면  [1] 부터 차례대로!
echo.
echo   ----------------------------------------------------------
echo    1.  처음이에요  -  설치하기        (제일 먼저)
echo    2.  사용하기    -  메뉴 열기       (설치 후)
echo    3.  사용설명서 보기 (도움말)
echo    4.  제거하기    -  깨끗이 지우기
echo.
echo    0.  닫기
echo   ----------------------------------------------------------
echo.
set "SEL="
set /p "SEL= 번호를 입력하고 Enter: "
if "!SEL!"=="1" goto :DO_INSTALL
if "!SEL!"=="2" goto :DO_RUN
if "!SEL!"=="3" goto :DO_HELP
if "!SEL!"=="4" goto :DO_UNINSTALL
if "!SEL!"=="0" goto :BYE
echo.
echo  [참고] 0 ~ 4 중에서 골라주세요.
timeout /t 2 >nul
goto :HOME

:DO_INSTALL
if not exist "%SCRIPT_DIR%\INSTALL.bat" ( echo [오류] INSTALL.bat 을 찾을 수 없습니다. & pause & goto :HOME )
call "%SCRIPT_DIR%\INSTALL.bat"
goto :HOME

:DO_RUN
if not exist "%SCRIPT_DIR%\RUN.bat" ( echo [오류] RUN.bat 을 찾을 수 없습니다. & pause & goto :HOME )
call "%SCRIPT_DIR%\RUN.bat"
goto :HOME

:DO_HELP
if exist "%SCRIPT_DIR%\README.md" (
    start "" notepad "%SCRIPT_DIR%\README.md"
) else (
    echo [참고] README.md 가 아직 없습니다.
    timeout /t 2 >nul
)
goto :HOME

:DO_UNINSTALL
if not exist "%SCRIPT_DIR%\UNINSTALL.bat" ( echo [오류] UNINSTALL.bat 을 찾을 수 없습니다. & pause & goto :HOME )
call "%SCRIPT_DIR%\UNINSTALL.bat"
goto :HOME

:BYE
echo.
echo  안녕히 가세요!
echo.
exit /b 0
