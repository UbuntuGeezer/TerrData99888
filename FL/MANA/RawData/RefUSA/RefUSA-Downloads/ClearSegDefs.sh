#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** ClearSegDefs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 12/12/22.	wmk.
#	Usage. bash ClearSegDefs.sh
#		
# Dependencies.
#	(leave line count the same)
#
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
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
# 11/9/21.	wmk.	add printf "%s\n" when initiated from make; add $ TODAY definition.
# 12/3/21.	wmk.	'procbodyhere' replaces proc body here for awk reversal.
# 4/8/22.	wmk.	HOME changed to USER in host test.	
P1=$1
TID=$P1
TN="Terr"
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
NAME_BASE="Terr"
SC_DB="_SC.db"
RU_DB="_RU.db"
SC_SUFFX="_SCBridge"
RU_SUFFX="_RUBridge"

#procbodyhere

# preambleClear.sh - ClearTerrSegs preamble.
#	2/15/23.	wmk.
printf "%s\n" "WARNING: you are about to clear the segment definitions"
read -p " for territory 264... continue (y/n)? "
yn=${REPLY^^}
if [ "$yn" == "N" ];then
 printf "%s\n" "  Review TerrID.db segment definitions for territory $P1."
 printf "%s\n" "   ClearTerrSegs abandoned at user request."
 exit 1
else
 printf "%s\n" "  Proceeding to clear segment definitions for territory $P1... "
fi
# end preambleClear.sh
printf "%s\n" "-- * ClearSegDefs.psq/sql - Clear TerriDData.SegDefs table of territory xxx entries."  > SQLTemp.sql
printf "%s\n" "-- * 2/15/23.	wmk."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Entry. Jumpto.sql contains SQL code to issue EndMessage table messages."  >> SQLTemp.sql
printf "%s\n" "-- *	    /DB-Dev/TerrIDData.db.DefSegs table contains definitions."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Exit. table TerriDData.SegDefs entries removed tor territory."  >> SQLTemp.sql
printf "%s\n" "-- *	   table TerrIDData.Territory.Segmented = 0 for territory."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Modification History."  >> SQLTemp.sql
printf "%s\n" "-- * ---------------------"  >> SQLTemp.sql
printf "%s\n" "-- * 2/15/23.	wmk.	original code; adpated from LoadSegDefs."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Notes. segdefs contains a set of WHERE clauses with the following pattern:"  >> SQLTemp.sql
printf "%s\n" "-- *	WHERE UnitAddress LIKE '%street1%'"  >> SQLTemp.sql
printf "%s\n" "-- *       OR UnitAddress LIKE '%street2%'"  >> SQLTemp.sql
printf "%s\n" "-- *	   OR (UnitAddress LIKE '%street3%'"  >> SQLTemp.sql
printf "%s\n" "-- *	     AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT) >= n1"  >> SQLTemp.sql
printf "%s\n" "-- *	     AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT) >= n2"  >> SQLTemp.sql
printf "%s\n" "-- *         AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT)%2 = 1)"  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * if TerrIDData.SegDefs already has entries for Territoryxxx, this query will do nothing."  >> SQLTemp.sql
printf "%s\n" "-- * test code... this query stops just short, creating Jumpto.sql in /Special."  >> SQLTemp.sql
printf "%s\n" "-- *;"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/DB-Dev/TerrIDData.db'"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS EndMessage;"  >> SQLTemp.sql
printf "%s\n" "CREATE TABLE EndMessage("  >> SQLTemp.sql
printf "%s\n" " msg TEXT)"  >> SQLTemp.sql
printf "%s\n" " ;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "INSERT INTO EndMessage"  >> SQLTemp.sql
printf "%s\n" "VALUES( \" ClearSegDefs initiated..\");"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DELETE FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" "WHERE TerrID IS '264';"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "UPDATE Territory"  >> SQLTemp.sql
printf "%s\n" "SET Segmented = 0"  >> SQLTemp.sql
printf "%s\n" "WHERE TerrID IS '264';"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS Counts264;"  >> SQLTemp.sql
printf "%s\n" "CREATE TABLE Counts264("  >> SQLTemp.sql
printf "%s\n" " Count INTEGER )"  >> SQLTemp.sql
printf "%s\n" ";"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO Counts264(Count)"  >> SQLTemp.sql
printf "%s\n" "SELECT count() TerriD FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" "WHERE TerrID IS '264';"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT Count FROM Counts264)"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO EndMessage"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.Count > 0"  >> SQLTemp.sql
printf "%s\n" "THEN \"  **ClearSegDefs FAILED - SegDefs for 264 not cleared.**\""  >> SQLTemp.sql
printf "%s\n" "ELSE \"  ClearSegDefs complete.\""  >> SQLTemp.sql
printf "%s\n" "END FROM a;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" "-- ** END ClearSegDefs.sql"  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
printf "%s\n" "  ClearSegDefs complete."
~/sysprocs/LOGMSG "  ClearSegDefs complete."
#end proc
