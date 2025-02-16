#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# DoSedWhichTerr.sh - *sed process WhichTerr.psq > WhichTerr.sql.
#	5/4/24.	wmk.
#
# Usage. bash  DoSedWhichTerr.sh <terrid> <addr>
#
#	<terrid> = territory ID in which to search
#	<addr> = address to search for in
#	  Terr<terrid>_SC.db/Terr<terrid>_SCBridge table.
#
# Entry. 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 5/4/24.	wmk.	original.
#
# Notes. 
#
# P1=<terrid>, P2=<addr>
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 echo "DoSedWhichTerr <terrid> <addr> missing parameter(s) - abandoned."
 exit 1
fi
~/sysprocs/LOGMSG "  DoSedWhichTerr - initiated from Terminal"
echo "  DoSedWhichTerr - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
projpath=$pathbase/$scpath
sed "s?<terrid>?$P1?g;s?<addr>?$P2?g" $projpath/WhichTerr.psq \
 > $projpath/WhichTerr.sql
#endprocbody
echo "  DoSedWhichTerr complete."
~/sysprocs/LOGMSG "  DoSedWhichTerr complete."
# end DoSedWhichTerr.sh
