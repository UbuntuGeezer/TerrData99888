-- * ListTerrSegs.psq/sql - export territory segments to Terr264Streetstxt.
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
. \nListTerrSegs.sql-out-of-date-exiting\n
.exit 1     -- ListTerrSegs.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
-- * 2/10/23.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 2/7/23.	wmk.	original code.
-- * 2/8/23.	wmk.	mod to write SQL "WHERE" snippet.
-- * Notes.
-- *;
.open '$pathbase/DB-Dev/TerrIDData.db'
.mode csv
.headers off
.output '$pathbase/$rupath/Terr264/segdefs.csv'
SELECT sqldef FROM SegDefs
 WHERE TerrID IS '264'
 ORDER BY RecNo;
.quit
-- * END ListTerrSegss.sql;
