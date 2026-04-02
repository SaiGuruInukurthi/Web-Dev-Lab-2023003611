@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "SRC=%SCRIPT_DIR%H1BApp"

if "%~1"=="" (
    set "DEST=C:\xampp\tomcat\webapps\H1BApp"
) else (
    set "DEST=%~1\webapps\H1BApp"
)

if not exist "%SRC%" (
    echo Source folder not found: %SRC%
    exit /b 1
)

robocopy "%SRC%" "%DEST%" /E /NFL /NDL /NJH /NJS /NC /NS /NP >nul
set "RC=%ERRORLEVEL%"

if %RC% GEQ 8 (
    echo Deployment failed. Robocopy exit code: %RC%
    exit /b %RC%
)

echo Deployment complete.
echo Source: %SRC%
echo Target: %DEST%

endlocal
