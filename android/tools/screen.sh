NowDate="$(date +%Y%m%d)-$(date +%H%M)"

adb connect 127.0.0.1:62001
adb shell screencap /sdcard/screen-$NowDate.png
adb pull /sdcard/screen-$NowDate.png .
