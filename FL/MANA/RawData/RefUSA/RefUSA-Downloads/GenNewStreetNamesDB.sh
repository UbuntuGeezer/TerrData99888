#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# GenNewStreetNamesDB.sh - Generate new StreetNamesDB.db database.
# 4/30/24.	wmk.
#
# Usage. bash  GenNewStreetNamesDB.sh
#
# Entry. 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 4/30/24.	wmk.	original.
#
# Notes. 
#
# set parameters P1..Pn here..
#
~/sysprocs/LOGMSG "  GenNewStreetNamesDB - initiated from Terminal"
echo "  GenNewStreetNamesDB - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
printf "%s\n" ".open '[pathbase]/[rupath]/Special/StreetNames.db'" > SQLTemp.sq
printf "%s\n" "DROP TABLE IF EXISTS Streets;" >> SQLTemp.sq
printf "%s\n" "CREATE TABLE Streets(" >> SQLTemp.sq
printf "%s\n" " StreetName TEXT," >> SQLTemp.sq
printf "%s\n" " SourceDB TEXT )" >> SQLTemp.sq
printf "%s\n" " ;" >> SQLTemp.sq
printf "%s\n" ".quit" >> SQLTemp.sq
$codebase/Procs-Dev/DoSedMacros.sh SQLTemp.sq SQLTemp.sql
sqlite3 < SQLTemp.sql
#endprocbody
echo "  GenNewStreetNamesDB complete."
~/sysprocs/LOGMSG "  GenNewStreetNamesDB complete."
# end GenNewStreetNamesDB.sh
