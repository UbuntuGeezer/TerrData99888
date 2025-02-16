-- * BldSpecStreetsDB.psq/sql - Build Streets table from /Special db.
. \nBldSpecStreetsDB.sql-out-of-date-exiting\n
.exit 1     -- BldSpecStreetsDB.sql out of-date
-- *	12/26/24.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 12/26/24.	wmk.	(automated) build 4.0.12 updates.
-- * 12/26/24.	wmk.	original.
-- *
-- * Notes. < spec-db > will be changed to a /Special db name througout by 
-- *  DoSedBldStreets.sh
-- * RefUSA-Downloads/Special/StreetNames.db . Streets is the target table.
-- * The territory ID is now inserted along with the street names.
-- * WARNING: this will only record the last street's territory ID, so
-- * will be inaccurate if a street is split across territories.
-- *
.open '$pathbase/$rupath/Special/StreetNames.db
ATTACH '$pathbase/$rupath/Special/BayIndiesMHP.db'
 AS db29;
INSERT or REPLACE INTO Streets(
 StreetName,
 SourceDB,
 TerrID
)
select distinct trim(substr(unitaddress,
 instr(unitaddress,' '))) Streets, '*rupath/BayIndiesMHP.db',
 CongTerrID
 from db29.Spec_RUBridge;

.quit
-- * END BldSpecStreetsDB.sql
