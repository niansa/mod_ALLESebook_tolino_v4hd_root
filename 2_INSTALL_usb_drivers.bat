@ECHO off
CLS
TITLE ALLESebook ADB Treiber 
COLOR 17
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                            ALLESebook ADB Treiber                           #
ECHO #                                                                             #
ECHO ###############################################################################
ECHO(
set /p answer=Willst du die ADB-Treiber installieren? (J/N):
if %answer% == J goto DRIVER
if %answer% == j goto DRIVER
if %answer% == y goto DRIVER
if %answer% == Y goto DRIVER
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:DRIVER
IF DEFINED programfiles(x86) GOTO x64
:x86
ECHO(
ECHO Installiere 32-bit Treiber ...
ECHO Bitte setze die Installation fort ...
PING localhost -n 1 >NUL
START /wait 2_usb_driver\DPInst_x86 /f 2>>%USERPROFILE%\Desktop\adb-installer.log
GOTO FINISH
:x64
ECHO(
ECHO Installiere 64-bit Treiber ...
ECHO Bitte setze die Installation fort ...
PING localhost -n 1 >NUL
START /wait 2_usb_driver\DPInst_x64 /f 2>>%USERPROFILE%\Desktop\adb-installer.log
GOTO FINISH
:FINISH
ECHO FERTIG! 
PAUSE
