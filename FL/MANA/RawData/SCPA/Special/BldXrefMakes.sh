#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 4/23/22.	wmk.
#	Usage. bash BldXrefMakes.sh
#		
# Dependencies.
#	(leave line count the same)
#
#
# Modification History.
# ---------------------
# 4/23/22.	wmk.	modified for FL/SARA/86777.
# 4/22/22.	wmk.	HOME changed to USER in host check.
# Legacy mods.
# 4/6/21.	wmk.	original shell (template)
# 6/17/21.	wmk.	multihost support.
# 9/6/21.	wmk.	jumpto function and references removed.
# 11/9/21.	wmk.	add echo when initiated from make; add $ TODAY definition.
# 12/3/21.	wmk.	'procbodyhere' replaces proc body here for awk reversal.
# 4/8/22.	wmk.	HOME changed to USER in host test.	
P1=$1
TID=$P1
TN="Terr"
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
if [ -z "$system_log" ]; then
  system_log=$folderbase/ubuntu/SystemLog.txt
  ~/sysprocs/LOGMSG "  BldXrefMakes - initiated from Make"
  echo "  BldXrefMakes - initiated from Make"
else
  ~/sysprocs/LOGMSG "  BldXrefMakes - initiated from Terminal"
  echo "  BldXrefMakes - initiated from Terminal"
fi 
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 TODAY=2022-04-22
fi
NAME_BASE="Terr"
SC_DB="_SC.db"
RU_DB="_RU.db"
SC_SUFFX="_SCBridge"
RU_SUFFX="_RUBridge"

#procbodyhere

echo "-- * XrefMakes.sql - Build XrefMakes.db from XrefMakes.csv;"  > SQLTemp.sql
echo "-- *	7/1/22.	wmk."  >> SQLTemp.sql
echo "-- *"  >> SQLTemp.sql
echo ".open '$pathbase/$scpath/Special/XrefMakes.db'"  >> SQLTemp.sql
echo "DROP TABLE IF EXISTS MakeTerrs;"  >> SQLTemp.sql
echo "CREATE TABLE MakeTerrs"  >> SQLTemp.sql
echo "(TerrNo TEXT, DBName TEXT);"  >> SQLTemp.sql
echo ".mode csv"  >> SQLTemp.sql
echo ".sep ,"  >> SQLTemp.sql
echo ".import '$pathbase/$scpath/Special/XrefMakes.csv' MakeTerrs"  >> SQLTemp.sql
echo ".quit"  >> SQLTemp.sql
echo "-- * end XrefMakes.sql;"  >> SQLTemp.sql
echo ""  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
echo "  BldXrefMakes complete."
~/sysprocs/LOGMSG "  BldXrefMakes complete."
#end proc
