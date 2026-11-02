@echo off
REM Launcher for PixFlow - uses the built-in Windows PowerShell (absolute path, no PATH dependency)
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File "%~dp0PixFlow.ps1" %*
exit /b %errorlevel%
