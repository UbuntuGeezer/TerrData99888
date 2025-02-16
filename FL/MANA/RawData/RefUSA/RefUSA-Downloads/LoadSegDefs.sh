#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** LoadSegDefs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 12/12/22.	wmk.
#	Usage. bash LoadSegDefs.sh
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

printf "%s\n" "-- * LoadSegDefs.psq/sql - Load Terr264/segdefs.csv file content into TerriDData.SegDefs table."  > SQLTemp.sql
printf "%s\n" "-- * 2/12/23.	wmk."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Exit. table TerriDData.Defs264 created by loading /Terr264/segdefs.csv"  >> SQLTemp.sql
printf "%s\n" "-- *	   table TerrIDData.264Counts created by querying SegDefs table for terr 264."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Modification History."  >> SQLTemp.sql
printf "%s\n" "-- * ---------------------"  >> SQLTemp.sql
printf "%s\n" "-- * 2/11/23.	wmk.	original code."  >> SQLTemp.sql
printf "%s\n" "-- * 2/12/23.	wmk.	.open statement added to Jumpto.sql; exit conditions documented."  >> SQLTemp.sql
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
printf "%s\n" "VALUES( \" LoadSegDefs initiated..\");"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS \"264Counts\";"  >> SQLTemp.sql
printf "%s\n" "CREATE TABLE \"264Counts\"("  >> SQLTemp.sql
printf "%s\n" " DefLines INTEGER )"  >> SQLTemp.sql
printf "%s\n" ";"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "SELECT count() TerriD FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" "WHERE TerrID IS '264';"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers OFF"  >> SQLTemp.sql
printf "%s\n" ".separator \" \""  >> SQLTemp.sql
printf "%s\n" ".output '$pathbase/$rupath/Special/Jumpto.sql'"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "DROP TABLE IF EXISTS JumptoSQL;"  >> SQLTemp.sql
printf "%s\n" "CREATE TEMP TABLE JumptoSQL("  >> SQLTemp.sql
printf "%s\n" " sqlsrc TEXT);"  >> SQLTemp.sql
printf "%s\n" "-- * write SQL source code to table then export;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- .open database line;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl > 0"  >> SQLTemp.sql
printf "%s\n" "THEN \".open '/home/vncwmk3/Territories/FL/SARA/86777/DB-Dev/TerrIDData.db'\""  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- ------------------------------------------------------------"  >> SQLTemp.sql
printf "%s\n" "-- do this if counts > 0; write to Jumpto.sql;"  >> SQLTemp.sql
printf "%s\n" "-- * SegDefs for territory 264 already exist; do not overwrite;"  >> SQLTemp.sql
printf "%s\n" "-- line 1 - INSERT INTO EndMessage;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl> 0"  >> SQLTemp.sql
printf "%s\n" "THEN "  >> SQLTemp.sql
printf "%s\n" "\"INSERT INTO EndMessage(msg) VALUES(' **  SegDefs for territory 264 already exist - LoadSegDefs abandoned. **');\""  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 2 SELECT msg FROM EndMessage;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl> 0"  >> SQLTemp.sql
printf "%s\n" "THEN "  >> SQLTemp.sql
printf "%s\n" "'SELECT msg FROM EndMessage;'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 3 .exit 3;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl> 0"  >> SQLTemp.sql
printf "%s\n" "THEN "  >> SQLTemp.sql
printf "%s\n" "'.exit 3'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl > 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "---------------------------------------------------------------"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- do this if counts = 0; write to Jumpto.sql;"  >> SQLTemp.sql
printf "%s\n" "-- write new defs into SegDefs table;"  >> SQLTemp.sql
printf "%s\n" "-- .open database line;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN \".open '/home/vncwmk3/Territories/FL/SARA/86777/DB-Dev/TerrIDData.db'\""  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 1;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN 'DROP TABLE IF EXISTS Defs264;'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 2;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN 'CREATE TABLE \"Defs264\"(newsql TEXT);'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 3;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN '.mode csv'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 4;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN  '.headers OFF'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 5;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN  '.separator |'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 6;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN   \".import '$pathbase/$rupath/Terr264/segdefs.csv' Defs264\""  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "-- line 7;"  >> SQLTemp.sql
printf "%s\n" "WITH a AS (SELECT DefLines dl FROM \"264Counts\")"  >> SQLTemp.sql
printf "%s\n" "INSERT INTO JumptoSQL"  >> SQLTemp.sql
printf "%s\n" "SELECT CASE WHEN a.dl = 0"  >> SQLTemp.sql
printf "%s\n" "THEN   '.quit'"  >> SQLTemp.sql
printf "%s\n" " ELSE '.quit'"  >> SQLTemp.sql
printf "%s\n" "END FROM \"264Counts\""  >> SQLTemp.sql
printf "%s\n" "INNER JOIN a"  >> SQLTemp.sql
printf "%s\n" "ON a.dl = 0;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "SELECT * FROM JumptoSQL;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" "INSERT INTO EndMessage"  >> SQLTemp.sql
printf "%s\n" "VALUES(\"  LoadSegDefs complete.\");"  >> SQLTemp.sql
printf "%s\n" "--========== end block which writes to Jumpto.sql =============;"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" "--==================================================================="  >> SQLTemp.sql
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
printf "%s\n" "-- * END LoadSegDefs.sql;"  >> SQLTemp.sql
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
printf "%s\n" "  LoadSegDefs complete."
~/sysprocs/LOGMSG "  LoadSegDefs complete."
#end proc
