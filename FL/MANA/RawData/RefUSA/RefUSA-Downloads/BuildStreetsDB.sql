-- * BuildStreetsDB.psq/sql - Build Streets table from SC and RU territory dbs.
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
. \nBuildStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BuildStreetsDB.sql out of-date
-- *	5/2/24.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 5/2/24.	wmk.	(automated) build 4.0.8 udpates.
-- * 9/11/23.   wmk.    (automated) ver2.0 SQL fixes.
-- * Legacy mods.
-- * 9/9/22.	wmk.	original.
-- *
-- * Notes. xx x will be changed to a territory ID throuth by DoSedBldStreets.sh
-- * RefUSA-Downloads/Special/StreeNames.db . Streets is the target table.
-- *
.open '$pathbase/$rupath/Special/StreetNames.db
ATTACH '$pathbase/$scpath/Special/BayIndiesMHP.db'
 AS db14;
ATTACH '$pathbase/$rupath/Special/BayIndiesMHP.db'
 AS db15;
INSERT or IGNORE INTO Streets
select distinct trim(substr(unitaddress,
 instr(unitaddress,' '))) Streets, '*scpath/Special/BayIndiesMHP.db'
 from db14.Spec_SCBridge;
INSERT or IGNORE INTO Streets
select distinct trim(substr(unitaddress,
 instr(unitaddress,' '))) Streets, '*rupath/Special/BayIndiesMHP.db'
 from db15.Spec_RUBridge;
.quit
-- * END BuildStreetsDB.sql
