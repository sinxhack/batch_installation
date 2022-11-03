@cd /d "%~dp0"
for /f "delims=" %%a in ('dir /b /a-d /s scut.exe') do %%a -noinstall -dbg
pause