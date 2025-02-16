-- * XrefMakes.sql - Build XrefMakes.db from XrefMakes.csv;
. \nBldXrefMakes.sql-out-of-date-exiting\n
.exit 1     -- BldXrefMakes.sql out of-date
-- 2023-09-21   wmk.   (automated) ver2.0 SQL fixes.
-- *	7/1/22.	wmk.
-- *
.open '$pathbase/$scpath/Special/XrefMakes.db'
DROP TABLE IF EXISTS MakeTerrs;
CREATE TABLE MakeTerrs
(TerrNo TEXT, DBName TEXT);
.mode csv
.sep ,
.import '$pathbase/$scpath/Special/XrefMakes.csv' MakeTerrs
.quit
-- * end XrefMakes.sql;

