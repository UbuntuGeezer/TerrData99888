#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# ListDBTerrs.sh 0 List all territories using <special-db>.
#	11/16/24.	wmk.
#
# Usage. bash   ListDBTerrs.sh <short-specdb>
#
#	<short-specdb> = dbname w/o .db extension
#
# Exit. MAKE list for Make.dbname.Terr output to Terminal
#		
# Modification History.
# ---------------------
# 11/16/24.	wmk.	original.
#
# P1=<short-specdb>
#
P1=$1
if [ -z "$P1" ];then
 echo "ListDBTerrs <short-specdb> missing parameter(s) - abandoned."
 exit 1
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$ldlp1
fi
#procbodyhere
pushd ./ > /dev/null
cd $pathbase/$scpath/Special
grep -e "MAKE).*Terr.*/MakeSpecials" Make.$P1.Terr
popd > /dev/null
#endprocbody
printf "%s\n" "  ListDBTerrs $P1 complete."
~/sysprocs/LOGMSG -q "  ListDBTerrs $P1 complete."
#end proc
