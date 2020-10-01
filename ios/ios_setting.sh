# Clutch 2.0.4
clutch_version=2.0.4
wget https://github.com/KJCracks/Clutch/releases/download/$clutch_version/Clutch-$clutch_version
chmod +x Clutch-$clutch_version
mv Clutch-$clutch_version /usr/bin/clutch
ldid -S/usr/share/entitlements/debugserver.xml /usr/bin/clutch

# keychain_dumper
git clone https://github.com/ptoomey3/Keychain-Dumper.git
cd Keychain-Dumper
chmod +x keychain_dumper
ldid -Sentitlements.xml keychain_dumper
mv keychain_dumper /usr/bin
cd ..
rm -rf Keychain-Dumper

# debugserver
# ldid -S/usr/share/entitlements/debugserver.xml /usr/bin/debugserver

# frida-server 12.6.11 (arm64)
wget https://github.com/frida/frida/releases/download/12.6.11/frida-server-12.6.11-ios-arm64.xz
xz -d frida-server-12.6.11-ios-arm64.xz
chmod +x frida-server-12.6.11-ios-arm64
mv frida-server-12.6.11-ios-arm64 /usr/bin/frida-server

# create result directory
mkdir /private/var/mobile/Media/result

# create link
cd ~
ln -s /private/var/mobile/Media/tools rawDir
