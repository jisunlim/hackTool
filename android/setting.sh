#dirPath=`pwd`
#basename=`basename $dirPath`
adb=./tools/adb

# package 확인
j=1
for i in $($adb shell ls /data/app); do
	echo "$j. $i"
	j=`expr $j + 1`
done

echo "select package: "
read n
packname=`$adb shell ls /data/app | sed -n "$n"p`
len="${#packname}"
basename=${packname:0:$len-2}
`mkdir $basename`
cd $basename

#cp ../tools/*.sh .

#apk 추출
$adb pull /data/app/$packname/base.apk

# data 디렉터리 추출
$adb shell cp -r /data/data/$basename /sdcard
$adb pull /sdcard/$basename
mv $basename data

#apk 압축해제
apktool d -f -r base.apk
mkdir dex2jar
cd dex2jar
unzip ../base.apk
d2j-dex2jar classes*.dex
