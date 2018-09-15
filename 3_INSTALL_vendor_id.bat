@echo off
CLS
TITLE ALLESebook Vendor ID
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
@ECHO Ger%ae%te-IDs werden eingetragen. Bitte warten ...
cd 3_adb
@adb kill-server
@adb start-server
@echo 0x1f85 >> "%USERPROFILE%\.android\adb_usb.ini
@echo 0x18d1 >> "%USERPROFILE%\.android\adb_usb.ini
@adb kill-server
@ECHO Fertig! Bitte schlie%ss%e dieses Fenster
PAUSE
