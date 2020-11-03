
adb=~/dev/platform-tools/adb

 # package 확인
 j=1
 for i in $($adb shell ls /data/app); do
     echo "$j. $i"
     j=`expr $j + 1`
 done
