-- * CheckParcel.psq/sql - Check Terr86777 for parcel ID present.
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
. \nCheckParcel.sql-out-of-date-exiting\n
.exit 1     -- CheckParcel.sql out of-date
-- *	4/12/23.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 4/12/23.	wmk.	original code.
-- *
-- * Notes. < parcel > and < tid > are substituted by *sed.
-- *;

.open '$pathbase/$rupath/Terr258/Terr258_RU.db' 
drop table if exists counter;
create temp table counter(nrecs integer,propid TEXT);
insert into counter(nrecs,propid)
VALUES(0,'0407061017');
UPDATE counter
SET nrecs =
CASE WHEN (SELECT COUNT() OwningParcel FROM Terr258_RUBridge
 where OwningParcel is '0407061017') > 0
 THEN 1
ELSE nrecs
END
WHERE propid IS '0407061017';
.separator " "
select 'Terr258_RU.db', propid, case when nrecs > 0 then 'exists' else 'does not exist' end
from counter where propid is '0407061017';
.quit
