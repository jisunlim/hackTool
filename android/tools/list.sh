 adb connect 127.0.0.1:62001

 # package 확인
 j=1
 for i in $(adb shell ls /data/app); do
     echo "$j. $i"
     j=`expr $j + 1`
 done
