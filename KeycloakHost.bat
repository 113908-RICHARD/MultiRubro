@echo off
setlocal
set "SCRIPT_DIR=%~dp0"
set "HOST_ENTRY=127.0.0.1 keycloak"
set "HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts"

echo %HOST_ENTRY% >> "%HOSTS_FILE%"

echo Host entry added successfully.
pause
