with a as (select distinct congterrid TID
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
. \nBuildTerrList.sql-out-of-date-exiting\n
.exit 1     -- BuildTerrList.sql out of-date
-- 2023-09-11   wmk.   (automated) ver2.0 SQL fixes.
 from Spec_RUBridge
 where congterrid is not '')
Insert into TerrList
SELECT congterrid, count(congterrid) from Spec_RUBridge
 where congterrid in (select TID from a);
