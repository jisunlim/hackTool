j=1
cd /private/var/containers/Bundle/Application
dirList=`ls -t`
for i in $(find $dirList -maxdepth 2 -mtime -30 -name '*.app' | sed 's/ /_/g' | sed -n '1,10p'); do
  basename=`basename $i`
  echo "$j. $basename"
  j=`expr $j + 1`
done

echo "select bundle:"
read n
bundle=`find $dirList -maxdepth 2 -mtime -30 -name '*.app' | sed -n "$n"p`
basename=`basename $bundle`

cd ${bundle%%/*.app}
fileName="Bundle-$(date +%y%m%d)-$(date +%H%M%S).tar"
tar cvf $fileName *
mv $fileName /private/var/mobile/Media/result

echo -e "\e[33mSuccess to move $fileName\e[0m"
