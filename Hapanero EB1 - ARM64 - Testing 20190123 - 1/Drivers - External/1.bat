@echo off
echo ÇëÊäÈëÇý¶¯Æ÷ºÅ£¨·¶Àý£º¡°Q:¡±£©
set /p drive=
xcopy /cheriky .\root\* %drive%
reg load HKEY_LOCAL_MACHINE\RTSOFTWARE "%drive%\Windows\System32\config\SOFTWARE"
reg load HKEY_LOCAL_MACHINE\RTSYSTEM "%drive%\Windows\System32\config\SYSTEM"
for /r %%i in (.\regs\*) do reg import %%i
for /r %%i in (.\later\*) do reg import %%i
for /r %%i in (.\later\old\*) do reg import %%i
for /r %%i in (.\later\old2\*) do reg import %%i
for /r %%i in (.\#Touchfixup\reg\*) do reg import %%i
reg unload HKEY_LOCAL_MACHINE\RTSOFTWARE
reg unload HKEY_LOCAL_MACHINE\RTSYSTEM
dism /Image:%drive% /Add-Driver /Driver:.\#Touchfixup\SynapticsTouch.inf
dism /Image:%drive% /Add-Driver /Driver:.\#Pep\qcpep8994.inf
dism /Image:%drive% /Add-Driver /Driver:.\#Uart\qcuart8994.inf
dism /Image:%drive% /Add-Driver /Driver:.\#revrmnet\qcrevrmnet.inf
dism /Image:%drive% /Add-Driver /Driver:.\#wlan\qcwlan8994.inf