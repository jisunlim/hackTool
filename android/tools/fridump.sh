dirPath=`pwd`
basename=`basename $dirPath`

# adb 연결
adb connect 127.0.0.1:62001

# frida 백그라운드로 실행
ver=`adb shell ls /data/local/tmp | grep frida-server`
adb shell /data/local/tmp/$ver &

# memory dump
python ~/dev/fridump/fridump.py -U -s $basename
cp -r ~/dev/fridump/dump .
