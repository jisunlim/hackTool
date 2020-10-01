pwd=`pwd`
basename=`basename $pwd`

adb shell am force-stop $basename
