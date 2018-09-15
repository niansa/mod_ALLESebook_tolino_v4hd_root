@echo off
CLS
TITLE ALLESebook Root und Apps installieren 
COLOR 17
cd 3_adb

@ECHO Eventuell auftretende Fehler können ignoiert werden!
@adb kill-server
@adb devices
@ECHO Apps werden installiert. Bitte warten ...
@adb push su /data/local/su
@adb push Superuser.apk /data/local/Superuser.apk
@adb shell mount -o rw,remount /dev/block/mmcblk0p5 /system
@adb shell busybox cp /data/local/Superuser.apk /system/app/Superuser.apk
@adb shell busybox cp /data/local/su /system/xbin/su
@adb shell ln -s /system/xbin/su /system/bin/su
@adb shell chmod 6755 /system/xbin/su
@adb shell chmod 644 /system/app/Superuser.apk
@adb shell mount -o ro,remount /dev/block/mmcblk0p5 /system
@adb install z_smartlauncher.apk
@adb install z_cr_3.1.2.apk
@adb install z_SWkey36.apk
@adb install z_tcandroid202.apk
@adb install z_nook_clear.apk
@adb install z_quick.apk
@adb push com.smart.swkey /data/data/com.smart.swkey
@adb shell "chmod 6755 /data/data/com.smart.swkey"
@adb shell "chmod 6755 /data/data/com.smart.swkey/*"
@adb push com.lggfc.nookclearscreen /data/data/com.lggfc.nookclearscreen
@adb shell "chmod 6755 /data/data/com.lggfc.nookclearscreen"
@adb shell "chmod 6755 /data/data/com.lggfc.nookclearscreen/*"
@adb push com.onexuan.quick /data/data/com.onexuan.quick
@adb shell "chmod 6755 /data/data/com.onexuan.quick"
@adb shell "chmod 6755 /data/data/com.onexuan.quick/*"
@adb push ginlemon.flowerfree /data/data/ginlemon.flowerfree
@adb shell "chmod 6755 /data/data/ginlemon.flowerfree"
@adb shell "chmod 6755 /data/data/ginlemon.flowerfree/*"
@adb shell monkey -p com.onexuan.quick -c android.intent.category.LAUNCHER 1
@adb shell reboot
@ECHO Der Tolino eReader startet in einem kurzen Moment neu.
cd..
cls
@ECHO ###############################################################################
@ECHO #                                                                             #
@ECHO #                                ALLESebook.de                                #
@ECHO #                                                                             #
@ECHO #                      FERTIG! - weiter geht's am Tolino                      #
@ECHO #                                                                             #
@ECHO ###############################################################################
pause
