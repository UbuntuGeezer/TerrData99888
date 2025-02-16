P1=$1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
cp $P1.sql $P1.tmp
cp $P1.sq $P1.sql
mv $P1.tmp $P1.sq
echo "$PWD $P1.sql and $P1.sq swapped."
~/sysprocs/LOGMSG "$PWD $P1.sql and $P1.sq swapped."
