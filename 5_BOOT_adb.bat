@echo off
CLS
TITLE ALLESebook Recovery Image
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
set /p answer=Hast du die Anleitung gelesen und verstanden? (J/N):
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
set /p answer=Willst du deinen Tolino Vision 4 HD rooten? (J/N):
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
@ECHO Den Tolino eReader nicht abstecken.
@ECHO Der Tolino eReader startet in einem kurzen Moment neu (nur Tolino Logo zu sehen).
cd 3_adb
@fastboot boot ../1_images/custom_recovery.img
@ECHO Schlie%ss%e dieses Fenster und folge der Anleitung.
pause