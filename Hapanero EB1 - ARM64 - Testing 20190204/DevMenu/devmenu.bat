@echo off
cd /d %~dp0
title Developer Menu添加工具 for RX-130/RX-127 with ARM64底层 by 五块二
echo 请输入EFIESP盘符（包含 ":"）
set /p P=
echo Copying files
md %P%:\Windows\System32\boot\ui\
copy "%cd%\0.bmpx" %P%\Windows\System32\boot\ui\boot.ums.connected.bmpx
copy "%cd%\1.bmpx" %P%\Windows\System32\boot\ui\boot.ums.disconnected.bmpx
copy "%cd%\2.bmpx" %P%\Windows\System32\boot\ui\boot.ums.waiting.bmpx
copy "%cd%\developermenu.efi" %P%\Windows\System32\boot\developermenu.efi
echo Writing registry
bcdedit /store %P%\efi\microsoft\boot\BCD >nul
reg load HKLM\ARM64BCD %P%\efi\microsoft\boot\BCD
reg import dev_menu.reg
reg unload HKLM\ARM64BCD
goto check
:check
bcdedit /store %P%\efi\microsoft\boot\BCD >nul
if errorlevel 1 (goto error
) else (
        echo 添加成功，开机时按下电源键即可进入。
        pause
        exit
)
:error
echo 发生错误，五十包邮。
pause
exit        


