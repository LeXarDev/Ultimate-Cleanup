@echo off
@echo ---------------DELETING TEMP FILES--------------

set folder="C:\Windows\Temp"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)


set folder="%userprofile%\AppData\Local\Temp"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

pause

@echo -------------AUTOMATIC DISK CLEANUP----------------

set R_Key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches
reg add "%R_Key%\Active Setup Temp Folders" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Thumbnail Cache" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Delivery Optimization Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\D3D Shader Cache" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Downloaded Program Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Internet Cache Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Setup Log Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Temporary Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Windows Error Reporting Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Offline Pages Files" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
reg add "%R_Key%\Recycle Bin" /v StateFlags0011 /t REG_DWORD /d 00000002 /f
cleanmgr.exe /sagerun:11
pause

