pwd=`pwd`
basename=`basename $pwd`

pid=`adb shell ps | grep $basename | awk '{print $2}'`
adb shell am dumpheap $pid /sdcard/$basename-mem
adb pull /sdcard/$basename-mem
hprof-conv $basename-mem dump_mem
rm $basename-mem
