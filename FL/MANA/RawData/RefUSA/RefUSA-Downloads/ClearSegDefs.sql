-- * ClearSegDefs.psq/sql - Clear TerriDData.SegDefs table of territory xxx entries.
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
. \nClearSegDefs.sql-out-of-date-exiting\n
.exit 1     -- ClearSegDefs.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
-- * 2/15/23.	wmk.
-- *
-- * Entry. Jumpto.sql contains SQL code to issue EndMessage table messages.
-- *	    /DB-Dev/TerrIDData.db.DefSegs table contains definitions.
-- *
-- * Exit. table TerriDData.SegDefs entries removed tor territory.
-- *	   table TerrIDData.Territory.Segmented = 0 for territory.
-- *
-- * Modification History.
-- * ---------------------
-- * 2/15/23.	wmk.	original code; adpated from LoadSegDefs.
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
VALUES( " ClearSegDefs initiated..");

DELETE FROM SegDefs
WHERE TerrID IS '264';

UPDATE Territory
SET Segmented = 0
WHERE TerrID IS '264';

DROP TABLE IF EXISTS Counts264;
CREATE TABLE Counts264(
 Count INTEGER )
;
INSERT INTO Counts264(Count)
SELECT count() TerriD FROM SegDefs
WHERE TerrID IS '264';

WITH a AS (SELECT Count FROM Counts264)
INSERT INTO EndMessage
SELECT CASE WHEN a.Count > 0
THEN "  **ClearSegDefs FAILED - SegDefs for 264 not cleared.**"
ELSE "  ClearSegDefs complete."
END FROM a;

.quit
-- ** END ClearSegDefs.sql
