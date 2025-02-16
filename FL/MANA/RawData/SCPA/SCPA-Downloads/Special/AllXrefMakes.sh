#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# AllXrefMakes.sh - XrefMakes on DBList.txt files.
#	6/30/22.	wmk.

file=DBList.txt
while read -e;do
 echo "processing $REPLY ..."
 ./XrefMakes.sh $REPLY
done < $file
