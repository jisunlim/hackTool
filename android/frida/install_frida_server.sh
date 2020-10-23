# adb connect 127.0.0.1:62001

adb=~/dev/platform-tools/adb

cpu=`$adb shell getprop ro.product.cpu.abi`

$adb push ./frida-server-$cpu /data/local/tmp/frida-server
$adb shell chmod 777 /data/local/tmp/frida-server
