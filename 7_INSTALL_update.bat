@echo off
CLS
TITLE ALLESebook Boot Image 
COLOR 17
chcp 1252>nul
set ue=ü
set ae=ä
set oe=ö
set Uue=Ü
set Aae=Ä
set Ooe=Ö
set ss=ß
chcp 850>nul
set /p answer=Wurden die ADB-Treiber korrekt installiert und ist das Tolino-Logo am eReader sichtbar (siehe Anleitung)? (J/N):
if %answer% == J goto G
if %answer% == j goto G
if %answer% == y goto G
if %answer% == Y goto G
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:G
cls
set /p answer=Willst du das Update jetzt auf eigene Gefahr installieren (siehe Anleitung)? (J/N):
if %answer% == J goto G
if %answer% == j goto G
if %answer% == y goto G
if %answer% == Y goto G
if %answer% == N goto N
if %answer% == n goto N
:N
exit
:G
cls
@ECHO Bitte warten ...
cd 3_adb
@adb kill-server
@adb devices
@ECHO Schritt 1 wird ausgef%ue%hrt. Bitte warten ...
REM @adb push ../1_images/custom_boot.img /sdcard/
@ECHO Schritt 1 wurde Ã¼bersprungen, da er nicht notwendig ist. Dies ist normal.
@ECHO Schritt 2 wird ausgef%ue%hrt. Bitte warten ...

@adb shell mount -t ext4 /dev/block/mmcblk0p5 /system
@adb pull /system/build.prop ./build.prop
ECHO persist.service.adb.enable=1>>".\build.prop"
ECHO persist.service.debuggable=1>>".\build.prop"
ECHO persist.sys.usb.config=mtp,adb>>".\build.prop"
@adb push ./build.prop /system/build.prop
@adb shell umount /system

@ECHO Sollte nach dieser Nachicht mehr als 15 Sekunden nichts passieren, dann kann der Tolino mit dem Reset-Knopf neu gestartet werden und die Anleitung kann fortgesetzt werden.
@adb shell sleep 3
@adb shell sync
@ECHO Schritt 3 wird ausgef%ue%hrt. Bitte warten ...
@adb shell sleep 3
@adb shell sync
@ECHO Der Tolino eReader wird nun neu gestartet. Bitte warten ...
@adb shell reboot
@ECHO Sobald der Startvorgang beendet ist und man sich am Startbildschim befindet, schlie%ss%e dieses Fenster und folge der Anleitung zum n%ae%chsten Punkt.
PAUSE
