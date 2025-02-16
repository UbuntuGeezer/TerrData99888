-- * CheckParcel.psq/sql - Check Terr86777 for parcel ID present.
-- *	4/12/23.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 4/12/23.	wmk.	original code.
-- *;

.open '$pathbase/DB-Dev/Terr86777.db' 
drop table if exists counter;
create temp table counter(nrecs integer,propid TEXT);
insert into counter(nrecs,propid)
select count() "account #", "0407061017"
from Terr86777
where "account #" is '0407061017';
.separator " "
select propid, case when nrecs > 0 then 'exists' else 'does not exist' end
from counter;
.quit
