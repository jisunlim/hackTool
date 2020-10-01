pwd=`pwd`
basename=`basename $pwd` 

adb shell cp -r /data/data/$basename /sdcard
adb pull /sdcard/$basename
