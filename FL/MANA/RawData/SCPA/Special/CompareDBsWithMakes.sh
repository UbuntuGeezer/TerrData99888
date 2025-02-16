#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 12/12/22.	wmk.
#	Usage. bash CompareDBsWithMakes.sh
#		
# Dependencies.
#	(leave line count the same)
#
#
# Modification History.
# ---------------------
# 10/4/22.    wmk.   (automated) fix *pathbase for CB system.
# 12/11/22.	wmk.	run SetToday.sh to export TODAY env var.
# 12/12/22.	wmk.	SetTody.sh path corrected.
# Legacy mods.
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
  ~/sysprocs/LOGMSG "  CompareDBsWithMakes - initiated from Make"
  echo "  CompareDBsWithMakes - initiated from Make"
else
  ~/sysprocs/LOGMSG "  CompareDBsWithMakes - initiated from Terminal"
  echo "  CompareDBsWithMakes - initiated from Terminal"
fi 
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 . $WINGIT_PATH/TerritoriesCB/FLsara76777/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
NAME_BASE="Terr"
SC_DB="_SC.db"
RU_DB="_RU.db"
SC_SUFFX="_SCBridge"
RU_SUFFX="_RUBridge"

#procbodyhere

echo "-- * CompareDBsWithMakes.sql - Compare list of <spec-db>.dbs with Make.<spec-db>Terr list."  > SQLTemp.sql
echo "-- * 2/6/23.	wmk."  >> SQLTemp.sql
echo "-- *"  >> SQLTemp.sql
echo "-- * Modification History."  >> SQLTemp.sql
echo "-- * ---------------------"  >> SQLTemp.sql
echo "-- * 2/6/23.	wmk.	original code."  >> SQLTemp.sql
echo "-- *"  >> SQLTemp.sql
echo "-- * Notes. /Special/MakeDBList.txt = list of \"Make\" dbs (without .db)"  >> SQLTemp.sql
echo "-- *	    /Special/DBsList.txt = list of *.dbs (without .db)"  >> SQLTemp.sql
echo "-- *;"  >> SQLTemp.sql
echo ".open '$pathbase/$scpath/Special/CompareDBMake.db'"  >> SQLTemp.sql
echo "DROP TABLE IF EXISTS Makes;"  >> SQLTemp.sql
echo "CREATE TABLE Makes("  >> SQLTemp.sql
echo " SpecMake TEXT,"  >> SQLTemp.sql
echo " PRIMARY KEY (SpecMake) );"  >> SQLTemp.sql
echo "DROP TABLE IF EXISTS SpecDBs;"  >> SQLTemp.sql
echo "CREATE TABLE SpecDBs("  >> SQLTemp.sql
echo " DBName TEXT,"  >> SQLTemp.sql
echo " PRIMARY KEY (DBName) );"  >> SQLTemp.sql
echo ".mode csv"  >> SQLTemp.sql
echo ".headers off"  >> SQLTemp.sql
echo ".import '$pathbase/$scpath/Special/MakeDBList.txt' Makes"  >> SQLTemp.sql
echo ".import '$pathbase/$scpath/Special/DBsList.txt' SpecDBs"  >> SQLTemp.sql
echo ".output '$pathbase/$scpath/Special/MissingMakes.csv'"  >> SQLTemp.sql
echo "WITH a AS (SELECT SpecMake FROM Makes)"  >> SQLTemp.sql
echo "SELECT DBName FROM SpecDBs"  >> SQLTemp.sql
echo " WHERE DBName NOT IN (SELECT SpecMake FROM A);"  >> SQLTemp.sql
echo ".quit"  >> SQLTemp.sql
echo "-- * END <sqlmodule>.sql;"  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
echo "  CompareDBsWithMakes complete."
~/sysprocs/LOGMSG "  CompareDBsWithMakes complete."
#end proc
