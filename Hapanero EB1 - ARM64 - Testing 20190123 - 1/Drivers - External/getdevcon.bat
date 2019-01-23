set drive=H:

reg load HKEY_LOCAL_MACHINE\RTSYSTEM "%drive%\Windows\System32\config\SYSTEM"
reg import devcon.reg
reg unload HKEY_LOCAL_MACHINE\RTSYSTEM

xcopy /cheriky .\devcon\* %drive%