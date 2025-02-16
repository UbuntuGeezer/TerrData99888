#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# XrefMakes.sh - cross-reference *make*s from Make.<special-db>.Terr
#	7/1/22.	wmk.
#
# Usage. bash  XrefMakes.sh <special-db>
#
#	<special-db> = /Special/<special-db> file (e.g. LPavia.db)
#	<type> = { SC | RU }
#
# XrefMakes will scan file Make.<special-db>.Terr and extract a list
# of territories that are dependent upon <special-db>. If <type> is
#	RU - use path RawData/RefUSA/RefUSA-Downloads/Special
#	SC - use path RawData/SCPA/SCPA-Downloads/Special
# 
P1=$1
P2=${2^^}
if [ -z "$P1" ];then
 echo "XrefMakes <special-db> missing paramter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 echo "<type> not specified - 'SC' assumed."
 P2=SC
fi
namelen=${#P1}
baselen=$(($namelen - 3))
db_base=${P1:0:$baselen}
if [ "$P2" == "SC" ];then
 rawpath=$pathbase/$scpath
elif [ "$P2" == "RU" ];then
 rawpath=$pathbase/$rupath
else
 echo "XrefMakes <special-db> [<type>] unrecognized <type> - abandoned."
 exit 1
fi
if [ 1 -eq 0 ];then
echo "namelen = $namelen"
echo "baslen = $baselen"
echo "db_base = '$db_base'"
exit 0
fi
#TID=$P1
#TN="Terr"
if [ -z "$folderbase" ];then
 if [ "$USER" == "ubuntu" ]; then
  folderbase=/media/ubuntu/Windows
 else
  folderbase=$HOME
 fi
fi
if [ -z "$pathbase" ];then
 export pathbase=$folderbase/Territories/FL/SARA/86777
fi
if [ -z "$scpath" ];then
 export scpath=RawData/SCPA/SCPA-Downloads
fi
if [ -z "$rupath" ];then
 export rupath=RawData/RefUSA/RefUSA-Downloads
fi
if [ -z "$system_log" ]; then
  system_log=$folderbase/ubuntu/SystemLog.txt
  ~/sysprocs/LOGMSG "  XrefMakes - initiated from Make"
  echo "  XrefMakes - initiated from Make"
else
  ~/sysprocs/LOGMSG "  XrefMakes - initiated from Terminal"
  echo "  XrefMakes - initiated from Terminal"
fi 
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 TODAY=2022-04-22
fi
#procbodyhere

if ! test -f $rawpath/Special/$P1;then
 echo "$rawpath/Special/$P1"
 echo "/Special/$P1 not found - terminated."
 ~/sysprocs/LOGMSG "  XrefMakes /Special/$P1 not found - terminated."
 exit 1
fi
#awk "/(MAKE)/ {print $3}" Make.$db_base.Terr
awk -v db_base=$db_base "/(MAKE)/ {print substr(\$0,29,3) \",\" db_base}" Make.$db_base.Terr \
 >> $rawpath/Special/XrefMakes.csv
echo "XrefMakes $P1 complete."
~/sysprocs/LOGMSG "   XrefMakes $P1 complete."
#end XrefMakes.sh
