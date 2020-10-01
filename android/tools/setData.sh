pwd=`pwd`
basename=`basename $pwd` 
NowDate="$(date +%Y%m%d)-$(date +%H%M)"

touch $basename/$NowDate
adb push $basename /sdcard
adb shell cp -r /sdcard/$basename /data/data/
