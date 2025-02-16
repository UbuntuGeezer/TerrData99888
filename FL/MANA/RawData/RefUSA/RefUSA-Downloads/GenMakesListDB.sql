-- * GenMakeListDB.sql - Generate MakeList db with MakeList table.
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
. \nGenMakesListDB.sql-out-of-date-exiting\n
.exit 1     -- GenMakesListDB.sql out of-date
-- *	10/21/24.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 10/21/24.	wmk.	(automated) *rupath, *scpath replace long paths.
-- * 10/21/24.	wmk.	(automated) build 4.0.9 updates.
-- * 10/21/24.	wmk.	original.
-- *;
.open '$pathbase/$rupath/Special/MakesList.db'
DROP TABLE IF EXISTS MakeList;
CREATE TABLE MakeList(
 DBName TEXT,
 Terr TEXT
 );
.mode csv
.separator ,
.headers off
.import '$pathbase/$rupath/Special/MakesList.csv' MakeList

# now set usage counts for each database;
DROP TABLE IF EXISTS DBCounts;
CREATE TABLE DBCounts(
 DBName TEXT,
 Count INTEGER DEFAULT 0
 );
INSERT INTO DBCounts (DBName)
SELECT DISTINCT DBName from MakeList;

UPDATE DBCounts
SET Count =
 (SELECT Count(DBName) FROM MakeList
 WHERE DBName is DBCounts.DBName);

.shell echo "  Import of MakesList.csv to MakeList.db complete."
.quit
-- * END GenMakeListDB.sql;
