-- * WhichTerr.psq/sql - SQL query to search Terrxxx_SCBridge table for address.
. \nWhichTerr.sql-out-of-date-exiting\n
.exit 1     -- WhichTerr.sql out of-date
-- *	5/4/24.	wmk.
-- *
-- * Notes. DoSedWhichTerr.sh edits < terrid > into search query.
-- *
.open '$pathbase/$scpath/Terr137/Terr137_SC.db'
.separator " "
SELECT 'Terr137_SC.db matching count = ', count(OwningParcel)
FROM Terr137_SCBridge
WHERE UnitAddress LIKE '%GREEN CIR%';
.quit
-- * END WhichTerr.sql
