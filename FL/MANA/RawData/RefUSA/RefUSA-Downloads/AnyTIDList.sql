-- AnyTIDList.psq/sql - Extract TID list from TerrList in <special-db>.
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
. \nAnyTIDList.sql-out-of-date-exiting\n
.exit 1     -- AnyTIDList.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
-- * 5/7/22.	wmk.	(automated) *pathbase* integration.
--	11/10/21.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 11/10/21.	wmk.	original code.
-- *
-- * Notes.
-- *

.open '$pathbase/RawData/RefUSA/RefUSA-Downloads/Special/WaterfordNW.db'
.mode csv
.headers ON
.separator ,
.output '$pathbase/RawData/RefUSA/RefUSA-Downloads/Special/WaterfordNW.TIDList.txt'
SELECT TerrID from TerrList
 WHERE TerrID NOTNULL
   AND Length(TRIM(TerrID)) > 0
ORDER BY TerrID;
.quit
-- ** end AnyTIDList.sql *****;
