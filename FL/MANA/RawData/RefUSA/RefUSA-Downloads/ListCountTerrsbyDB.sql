-- *ListCountTerrsbyDB.psq/sql - List territories using special database.
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
-- *	12/20/22.	wmk.
.open '$pathbase/RawData/RefUSA/RefUSA-Downloads/Special/<spec-db>.db'
.output '$TEMP_PATH/DBTerrList.txt'
select TerrID from TerrList
 where length(trim(counts)) > 0 
  AND cast(Counts as integer) > 0
  AND TerrID NOT NULL
  order by TerrID;
.quit
-- * end ListCountTerrsbyDB.psq/sql
