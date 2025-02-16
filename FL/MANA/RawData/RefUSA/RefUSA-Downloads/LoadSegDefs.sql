-- * LoadSegDefs.psq/sql - Load Terr264/segdefs.csv file content into TerriDData.SegDefs table.
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
. \nLoadSegDefs.sql-out-of-date-exiting\n
.exit 1     -- LoadSegDefs.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
-- * 2/12/23.	wmk.
-- *
-- * Exit. table TerriDData.Defs264 created by loading /Terr264/segdefs.csv
-- *	   table TerrIDData.264Counts created by querying SegDefs table for terr 264.
-- *
-- * Modification History.
-- * ---------------------
-- * 2/11/23.	wmk.	original code.
-- * 2/12/23.	wmk.	.open statement added to Jumpto.sql; exit conditions documented.
-- *
-- * Notes. segdefs contains a set of WHERE clauses with the following pattern:
-- *	WHERE UnitAddress LIKE '%street1%'
-- *       OR UnitAddress LIKE '%street2%'
-- *	   OR (UnitAddress LIKE '%street3%'
-- *	     AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT) >= n1
-- *	     AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT) >= n2
-- *         AND CAST(SUBSTR(UnitAddress,1,INSTR(UnitAddress,' ')) AS INT)%2 = 1)
-- *
-- * if TerrIDData.SegDefs already has entries for Territoryxxx, this query will do nothing.
-- * test code... this query stops just short, creating Jumpto.sql in /Special.
-- *;
.open '$pathbase/DB-Dev/TerrIDData.db'

DROP TABLE IF EXISTS EndMessage;
CREATE TABLE EndMessage(
 msg TEXT)
 ;

INSERT INTO EndMessage
VALUES( " LoadSegDefs initiated..");

DROP TABLE IF EXISTS "264Counts";
CREATE TABLE "264Counts"(
 DefLines INTEGER )
;
INSERT INTO "264Counts"
SELECT count() TerriD FROM SegDefs
WHERE TerrID IS '264';

.mode csv
.headers OFF
.separator " "
.output '$pathbase/$rupath/Special/Jumpto.sql'

DROP TABLE IF EXISTS JumptoSQL;
CREATE TEMP TABLE JumptoSQL(
 sqlsrc TEXT);
-- * write SQL source code to table then export;

-- .open database line;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl > 0
THEN ".open '/home/vncwmk3/Territories/FL/SARA/86777/DB-Dev/TerrIDData.db'"
END FROM "264Counts"
INNER JOIN a
ON a.dl > 0;

-- ------------------------------------------------------------
-- do this if counts > 0; write to Jumpto.sql;
-- * SegDefs for territory 264 already exist; do not overwrite;
-- line 1 - INSERT INTO EndMessage;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl> 0
THEN 
"INSERT INTO EndMessage(msg) VALUES(' **  SegDefs for territory 264 already exist - LoadSegDefs abandoned. **');"
END FROM "264Counts"
INNER JOIN a
ON a.dl > 0;

-- line 2 SELECT msg FROM EndMessage;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl> 0
THEN 
'SELECT msg FROM EndMessage;'
END FROM "264Counts"
INNER JOIN a
ON a.dl > 0;

-- line 3 .exit 3;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl> 0
THEN 
'.exit 3'
END FROM "264Counts"
INNER JOIN a
ON a.dl > 0;

---------------------------------------------------------------

-- do this if counts = 0; write to Jumpto.sql;
-- write new defs into SegDefs table;
-- .open database line;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN ".open '/home/vncwmk3/Territories/FL/SARA/86777/DB-Dev/TerrIDData.db'"
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 1;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN 'DROP TABLE IF EXISTS Defs264;'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 2;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN 'CREATE TABLE "Defs264"(newsql TEXT);'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 3;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN '.mode csv'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 4;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN  '.headers OFF'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 5;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN  '.separator |'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 6;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN   ".import '$pathbase/$rupath/Terr264/segdefs.csv' Defs264"
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

-- line 7;
WITH a AS (SELECT DefLines dl FROM "264Counts")
INSERT INTO JumptoSQL
SELECT CASE WHEN a.dl = 0
THEN   '.quit'
 ELSE '.quit'
END FROM "264Counts"
INNER JOIN a
ON a.dl = 0;

SELECT * FROM JumptoSQL;

INSERT INTO EndMessage
VALUES("  LoadSegDefs complete.");
--========== end block which writes to Jumpto.sql =============;

.quit
--===================================================================
--CREATE TEMP TABLE "264Defs"(;
CREATE TEMP TABLE "264Defs"(
 newsql TEXT)
;
.mode csv
.headers OFF
.import '$pathbase/$rupath/Terr264/sqldefs.csv' "264Defs"
DROP TABLE IF EXISTS NewDefs;
CREATE TABLE NewDefs(
 newsql TEXT)
 ;

.import '$pathbase/$rupath/Terr264/segdefs.csv' NewDefs
INSERT INTO 

.mode csv
.headers OFF
.separator |
.output '$pathbase/$rupath/Special/Jumpto.sql'
WITH a AS (SELECT DefLines dl FROM "264Counts")
SELECT CASE WHEN a.dl > 0
THEN 'select '** '
END FROM "264Counts"
INNER JOIN a
ON a.dl > 0;

.read '$pathbase/$rupath/Special/Jumpto.sql'
.quit



--################################################
WITH a AS (SELECT DefLines dl FROM "264Counts"),
 b AS (SELECT newsql newdef FROM "264Defs")
INSERT INTO SegDefs(TerrID,dbName,sqldef)
SELECT CASE WHEN a.dl > 0
THEN '.quit'
END FROM 264Counts;

WITH a AS (SELECT DefLines dl FROM "264Counts")
SELECT CASE WHEN a.dl > 0
THEN sqldef
END sqldef FROM SegDefs
INNER JOIN a
ON a.dl > 0;
-- * END LoadSegDefs.sql;
--========================================================
all the code from EXECUTE SQL..
WITH a AS (SELECT DefLines dl FROM "264Counts"),
 b AS (SELECT newsql newdef FROM "264Defs")
INSERT INTO SegDefs(TerrID,dbName,sqldef)
SELECT CASE WHEN a.dl = 0
'371','BayLakeMHP',b.newdef
FROM "264Defs"
UNION a,b;

WITH a AS (SELECT DefLines dl FROM "264Counts"),
 b AS (SELECT sqldef newdef FROM "264Defs")
INSERT INTO SegDefs(TerrID,dbName,sqldef)
SELECT CASE WHEN a.dl = 0
'371','BayLakeMHP',b.newdef
FROM "264Defs"
UNION a,b;


clear;

--this code only selects records if 264Counts.dl=0;
WITH a AS (SELECT DefLines dl FROM "264Counts"),
 b AS (SELECT newsql newdef FROM "264Defs")
SELECT CASE WHEN a.dl = 0
THEN '371' END terrid,
CASE WHEN a.dl = 0 THEN 'BayLakeMHP' END dname,
CASE WHEN a.dl = 0 THEN b.newdef END segsql
FROM "264Defs"
INNER JOIN a
ON a.dl = 0
INNER JOIN b
ON b.newdef NOT NULL;

WITH a AS (SELECT DefLines dl FROM "264Counts"),
 b AS (SELECT newsql newdef FROM "264Defs")
SELECT CASE WHEN a.dl = 0
THEN '371' END,
CASE WHEN a.dl = 0 THEN 'BayLakeMHP' END,
CASE WHEN a.dl = 0 THEN b.newdef END
FROM "264Defs"
INNER JOIN a
ON a.dl = 0
INNER JOIN b
ON b.newdef NOT NULL;

