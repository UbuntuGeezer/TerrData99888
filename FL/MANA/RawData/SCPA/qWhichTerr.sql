-- * WhichTerr.psq - SQL query to search Terrxxx_SCBridge table for address.
. \nqWhichTerr.sql-out-of-date-exiting\n
.exit 1     -- qWhichTerr.sql out of-date
-- *	5/4/24.	wmk.
-- *
-- * Notes. DoSedWhichTerr.sh edits < terrid > into search query.
-- *
.open '$pathbase/$scpath/TerrGREEN CIR/TerrGREEN CIR_SC.db'
SELECT 'GREEN CIR matching count = ', count(OwningParcel)
FROM TerrGREEN CIR_SCBridge
WHERE UnitAddress LIKE '%-d%';
.quit
-- * END WhichTerr.psq
