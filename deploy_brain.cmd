@echo off
setlocal

if exist "%~dp0deploy_brain.ps1" goto run_ps1

where bash >nul 2>nul
if errorlevel 1 goto no_launcher

bash "%~dp0deploy_brain.sh" %*
exit /b %errorlevel%

:run_ps1
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0deploy_brain.ps1" %*
exit /b %errorlevel%

:no_launcher
echo [ERROR] No launcher available. Install PowerShell or bash ^(Git Bash/WSL^).
exit /b 1