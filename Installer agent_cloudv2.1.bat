@cd /d "%~dp0"
@taskkill /f /im CleanWipe.exe
@for /f "delims=" %%i in ('dir /b /a-d /s EasyFixSysCerts.exe') do %%~fi A1
@cls
@RD Log
@cls
@echo "Please Wait 1-2Minutes for EasyFix Running before Continue"
@pause
@for /f "delims=" %%i in ('dir /b /a-d /s SCPeasyFix.log') do "%%~fi"
@cls
@for /f "delims=" %%i in ('dir /b /a-d /s SCPeasyFix.log') do del %%~fi
@cls


@echo "Detecting OS processor type"
@if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
@echo "Detected 32-bit OS"
@echo "Starting TrendMicro Installation"
@for /f "delims=" %%i in ('dir /b /a-d /s agent_cloud_x86.msi') do "%%~fi"
@cls
@for /f "delims=" %%i in ('dir /b /a-d /s OFCNTINST.LOG') do del %%~fi
@cls
@pause
:END

goto END
:64BIT
@echo "Detected 64-bit OS"
@echo "Starting TrendMicro Installation"
@for /f "delims=" %%i in ('dir /b /a-d /s agent_cloud_x64.msi') do "%%~fi"
@cls
@for /f "delims=" %%i in ('dir /b /a-d /s OFCNTINST.LOG') do del %%~fi
@cls
:END
@pause
@del OFCNTINST.LOG