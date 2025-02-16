-- * CompareDBsWithMakes.sql - Compare list of <spec-db>.dbs with Make.<spec-db>Terr list.
-- 2023-09-21   wmk.   (automated) ver2.0 SQL fixes.
-- * 2/6/23.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 2/6/23.	wmk.	original code.
-- *
-- * Notes. /Special/MakeDBList.txt = list of "Make" dbs (without .db)
-- *	    /Special/DBsList.txt = list of *.dbs (without .db)
-- *;
.open '$pathbase/$scpath/Special/CompareDBMake.db'
DROP TABLE IF EXISTS Makes;
CREATE TABLE Makes(
 SpecMake TEXT,
 PRIMARY KEY (SpecMake) );
DROP TABLE IF EXISTS SpecDBs;
CREATE TABLE SpecDBs(
 DBName TEXT,
 PRIMARY KEY (DBName) );
.mode csv
.headers off
.import '$pathbase/$scpath/Special/MakeDBList.txt' Makes
.import '$pathbase/$scpath/Special/DBsList.txt' SpecDBs
.output '$pathbase/$scpath/Special/MissingMakes.csv'
WITH a AS (SELECT SpecMake FROM Makes)
SELECT DBName FROM SpecDBs
 WHERE DBName NOT IN (SELECT SpecMake FROM A);
.quit
-- * END <sqlmodule>.sql;
