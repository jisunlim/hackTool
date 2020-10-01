j=1
cd /private/var/containers/Bundle/Application
dirList=`ls -t`
list=`find $dirList -maxdepth 2 -mtime -30 -name '*.app' | sed 's/ /_/g' | sed -n '1,10p'`

for i in $list; do
  basename=`basename $i`
  echo "$j. $basename"
  j=`expr $j + 1`
done

echo "select bundle:"
read n

bundle=`find $dirList -maxdepth 2 -mtime -30 -name '*.app' | sed 's/ /_/g' | sed -n "$n"p`

appname=`echo $bundle | sed 's/^.*\///g' | sed 's/.app$//g'`

fullName=`echo "$bundle/$appname" | sed 's/_/\\\ /g'`
echo $fullName
debugserver localhost:1234 -x backboard $fullName
