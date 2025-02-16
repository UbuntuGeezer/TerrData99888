#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** AddSegDefs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 12/12/22.	wmk.
#	Usage. bash AddSegDefs.sh
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

printf "%s\n" "-- * AddSegDefs.psq/sql - Add content of TerrIDData.Defs264 table into TerriDData.SegDefs table."  > SQLTemp.sql
printf "%s\n" "-- * 2/12/23.	wmk."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Entry. table TerriDData.Defs264 created by loading /Terr264/segdefs.csv"  >> SQLTemp.sql
printf "%s\n" "-- *	    table TerrIDData.264Counts created by querying SegDefs table for terr 264."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Exit. table TerrIDData.SegDefs has new records added from Defs264 table."  >> SQLTemp.sql
printf "%s\n" "-- *       tables Defs264 and 264Counts removed from TerrIDData."  >> SQLTemp.sql
printf "%s\n" "-- *	   \"Segmented\" field set to 1 in Territory table for Terrxxx."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Modification History."  >> SQLTemp.sql
printf "%s\n" "-- * ---------------------"  >> SQLTemp.sql
printf "%s\n" "-- * 2/11/23.	wmk.	original code."  >> SQLTemp.sql
printf "%s\n" "-- * 2/12/23.	wmk.	.open statement added to Jumpto.sql; PrevCounts references"  >> SQLTemp.sql
printf "%s\n" "-- * 			 removed; bug fix Defxxx corrected to Defsxxx; exit conditions"  >> SQLTemp.sql
printf "%s\n" "-- *			 documented."  >> SQLTemp.sql
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
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * This query is the last in the sequence; it uses the table EndMessage to write"  >> SQLTemp.sql
printf "%s\n" "-- * a script to Jumpto.sql that issues the \"complete\" or \"abandoned\" message.."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * tables."  >> SQLTemp.sql
printf "%s\n" "-- *	EndMessage - ending message table; messages written by Jumpto.sql"  >> SQLTemp.sql
printf "%s\n" "-- *	264Counts = .status, DefLines, status=0 if Def264"  >> SQLTemp.sql
printf "%s\n" "-- *	DefExists,status = 0 if Defs264 table exists"  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- *;"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/DB-Dev/TerrIDData.db'"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "--DROP TABLE IF EXISTS EndMessage;"  >> SQLTemp.sql
printf "%s\n" "--CREATE TABLE EndMessage("  >> SQLTemp.sql
printf "%s\n" "-- msg TEXT);"  >> SQLTemp.sql
printf "%s\n" " "  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS \"264Counts\";"  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE \"264Counts\"("  >> SQLTemp.sql
printf "%s\n" " DefLines INTEGER )"  >> SQLTemp.sql
printf "%s\n" " ;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "INSERT INTO EndMessage(msg)"  >> SQLTemp.sql
printf "%s\n" "VALUES(\"  ** AddSegDefs FAILED - Check TerrIDData database for territory 264 **\");"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE DefExists("  >> SQLTemp.sql
printf "%s\n" " status INTEGER)"  >> SQLTemp.sql
printf "%s\n" " ;"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO DefExists(status)"  >> SQLTemp.sql
printf "%s\n" "SELECT EXISTS("  >> SQLTemp.sql
printf "%s\n" "SELECT name FROM sqlite_schema"  >> SQLTemp.sql
printf "%s\n" " WHERE type is 'table'"  >> SQLTemp.sql
printf "%s\n" "   AND name is 'Defs264');"  >> SQLTemp.sql
printf "%s\n" "   "  >> SQLTemp.sql
printf "%s\n" "-- -------------- insert records here ---------------------------;"  >> SQLTemp.sql
printf "%s\n" "-- * unconditionally insert new records;"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO SegDefs(TerriD, dbName, sqldef)"  >> SQLTemp.sql
printf "%s\n" "SELECT '264', 'RidgewoodMHP', newsql"  >> SQLTemp.sql
printf "%s\n" "FROM Defs264;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- set ending message;"  >> SQLTemp.sql
printf "%s\n" "DELETE FROM EndMessage;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "INSERT INTO EndMessage(msg)"  >> SQLTemp.sql
printf "%s\n" "VALUES('  AddSegDefs for 264 complete.');"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS Defs264;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- * ensure Segmented flag set if there are defs for this territory;"  >> SQLTemp.sql
printf "%s\n" "UPDATE Territory"  >> SQLTemp.sql
printf "%s\n" "SET Segmented ="  >> SQLTemp.sql
printf "%s\n" "CASE WHEN (SELECT COUNT() TerrID FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" " WHERE TerrID IS '264') > 0"  >> SQLTemp.sql
printf "%s\n" " THEN 1"  >> SQLTemp.sql
printf "%s\n" "ELSE 0"  >> SQLTemp.sql
printf "%s\n" "END "  >> SQLTemp.sql
printf "%s\n" "WHERE TerrID IS '264';"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- ---------- write completion message --------------;"  >> SQLTemp.sql
printf "%s\n" "-- do this in all cases; write to EndMessage code to Jumpto.sql;"  >> SQLTemp.sql
printf "%s\n" "-- entry. 264Counts.DefLines = line count"  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers OFF"  >> SQLTemp.sql
printf "%s\n" ".separator \"|\""  >> SQLTemp.sql
printf "%s\n" ".output '$pathbase/$rupath/Special/Jumpto.sql'"  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS JumptoSQL;"  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE JumptoSQL("  >> SQLTemp.sql
printf "%s\n" " sqlsrc TEXT);"  >> SQLTemp.sql
printf "%s\n" "-- * write SQL source code to table then export;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- .open database line;"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "VALUES(\".open '/home/vncwmk3/Territories/FL/SARA/86777/DB-Dev/TerrIDData.db'\");"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 1;"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "VALUES('SELECT * FROM EndMessage;');"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 3;"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "VALUES('.quit');"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "SELECT * FROM JumptoSQL;"  >> SQLTemp.sql
printf "%s\n" "--========== end block which writes to Jumpto.sql =============;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" "-- ==============================================================;"  >> SQLTemp.sql
printf "%s\n" "-- more experimental code...;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS \"264Counts\";"  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE \"264Counts\"("  >> SQLTemp.sql
printf "%s\n" " status INTEGER,"  >> SQLTemp.sql
printf "%s\n" " DefLines INTEGER )"  >> SQLTemp.sql
printf "%s\n" " ;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT status FROM DefExists)"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO \"264Counts\"(status)"  >> SQLTemp.sql
printf "%s\n" "SELECT a.status"  >> SQLTemp.sql
printf "%s\n" "FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.status IS NOT NULL"  >> SQLTemp.sql
printf "%s\n" "LIMIT 1;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "UPDATE \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "SET DefLines ="  >> SQLTemp.sql
printf "%s\n" "CASE WHEN status > 0 THEN"  >> SQLTemp.sql
printf "%s\n" " (SELECT COUNT() sqldef FROM SegDefs "  >> SQLTemp.sql
printf "%s\n" "  WHERE TerrID is '264')"  >> SQLTemp.sql
printf "%s\n" " ELSE 0"  >> SQLTemp.sql
printf "%s\n" " END;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "--===================================================================;"  >> SQLTemp.sql
printf "%s\n" "--CREATE TEMP TABLE \"264Defs\"(;"  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE \"264Defs\"("  >> SQLTemp.sql
printf "%s\n" " newsql TEXT)"  >> SQLTemp.sql
printf "%s\n" ";"  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers OFF"  >> SQLTemp.sql
printf "%s\n" ".import '$pathbase/$rupath/Terr264/sqldefs.csv' \"264Defs\""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS NewDefs;"  >> SQLTemp.sql
printf "%s\n" "CREATE TABLE NewDefs("  >> SQLTemp.sql
printf "%s\n" " newsql TEXT)"  >> SQLTemp.sql
printf "%s\n" " ;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".import '$pathbase/$rupath/Terr264/segdefs.csv' NewDefs"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO "  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers OFF"  >> SQLTemp.sql
printf "%s\n" ".separator |"  >> SQLTemp.sql
printf "%s\n" ".output '$pathbase/$rupath/Special/Jumpto.sql'"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl > 0"  >> SQLTemp.sql
printf "%s\n" "THEN 'select '** '"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".read '$pathbase/$rupath/Special/Jumpto.sql'"  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "--################################################"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\"),"  >> SQLTemp.sql
printf "%s\n" " b AS (SELECT newsql newdef FROM \"264Defs\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO SegDefs(TerrID,dbName,sqldef)"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl > 0"  >> SQLTemp.sql
printf "%s\n" "THEN '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM 264Counts;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl > 0"  >> SQLTemp.sql
printf "%s\n" "THEN sqldef"  >> SQLTemp.sql
printf "%s\n" "END sqldef FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" "-- * END AddSegDefs.sql;"  >> SQLTemp.sql
printf "%s\n" "--========================================================"  >> SQLTemp.sql
printf "%s\n" "all the code from EXECUTE SQL.."  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\"),"  >> SQLTemp.sql
printf "%s\n" " b AS (SELECT newsql newdef FROM \"264Defs\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO SegDefs(TerrID,dbName,sqldef)"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "'371','BayLakeMHP',b.newdef"  >> SQLTemp.sql
printf "%s\n" "FROM \"264Defs\""  >> SQLTemp.sql
printf "%s\n" "UNION a,b;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\"),"  >> SQLTemp.sql
printf "%s\n" " b AS (SELECT sqldef newdef FROM \"264Defs\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO SegDefs(TerrID,dbName,sqldef)"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "'371','BayLakeMHP',b.newdef"  >> SQLTemp.sql
printf "%s\n" "FROM \"264Defs\""  >> SQLTemp.sql
printf "%s\n" "UNION a,b;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "clear;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "--this code only selects records if 264Counts.dl=0;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\"),"  >> SQLTemp.sql
printf "%s\n" " b AS (SELECT newsql newdef FROM \"264Defs\")"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN '371' END terrid,"  >> SQLTemp.sql
printf "%s\n" "CASE WHEN a.dl = 0 THEN 'BayLakeMHP' END dname,"  >> SQLTemp.sql
printf "%s\n" "CASE WHEN a.dl = 0 THEN b.newdef END segsql"  >> SQLTemp.sql
printf "%s\n" "FROM \"264Defs\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "INNER JOIN b"  >> SQLTemp.sql
printf "%s\n" "ON b.newdef NOT NULL;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\"),"  >> SQLTemp.sql
printf "%s\n" " b AS (SELECT newsql newdef FROM \"264Defs\")"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN '371' END,"  >> SQLTemp.sql
printf "%s\n" "CASE WHEN a.dl = 0 THEN 'BayLakeMHP' END,"  >> SQLTemp.sql
printf "%s\n" "CASE WHEN a.dl = 0 THEN b.newdef END"  >> SQLTemp.sql
printf "%s\n" "FROM \"264Defs\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "INNER JOIN b"  >> SQLTemp.sql
printf "%s\n" "ON b.newdef NOT NULL;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
printf "%s\n" "  AddSegDefs complete."
~/sysprocs/LOGMSG "  AddSegDefs complete."
#end proc
