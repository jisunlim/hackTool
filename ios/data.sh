j=1
cd /var/mobile/Containers/Data/Application
dirList=`ls -t`
for i in $(find $dirList -maxdepth 4 -mtime -30 -name '*.plist' | grep "/Library/Preferences" | sed 's/ /_/g' | sed -n '1,10p'); do
  basename=`basename $i`
  echo "$j. $basename"
  j=`expr $j + 1`
done

echo "select plist:"
read n
plistPath=`find $dirList -maxdepth 4 -mtime -30 -name '*.plist' | grep "/Library/Preferences" | sed -n "$n"p`

cd ${plistPath%%/Library*}
fileName="Data-$(date +%y%m%d)-$(date +%H%M%S).tar"
tar cvf $fileName *
mv $fileName /private/var/mobile/Media/result

echo -e "\e[33mSuccess to move $fileName\e[0m"
echo "path: /var/mobile/Containers/Data/Application/${plistPath%%/Library*}"
