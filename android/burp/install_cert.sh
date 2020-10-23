# openssl x509 -inform DER -in cacert.der -out cacert.pem
# openssl x509 -inform PEM -subject_hash_old -in cacert.pem

adb=~/dev/platform-tools/adb

$adb push ./cacert.pem /sdcard
$adb shell mv /sdcard/cacert.pem /system/etc/security/cacerts/9a5ba575.0
$adb shell chmod 644 /system/etc/security/cacerts/9a5ba575.0
$adb shell reboot
