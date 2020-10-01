dirPath=`pwd`
basename=`basename $dirPath`

# adb 연결
adb connect 127.0.0.1:62001

# 기존 앱 제거
adb uninstall $basename

# 리패키징
apktool b base -o new.apk

# 서명
expect << EOL
spawn ~/Library/Android/sdk/build-tools/28.0.3/apksigner sign --ks ../tools/key.jks new.apk
expect "Keystore password for signer #1:"
	send "key123\r"
expect eof
EOL

# 서명 검증
#jarsigner -verify -verbose -certs new.apk

# 최적화
NowDate="$(date +%Y%m%d)-$(date +%H%M)"
~/Library/Android/sdk/build-tools/28.0.3/zipalign -v 4 new.apk base-$NowDate.apk

# 설치
adb install -r base-$NowDate.apk
