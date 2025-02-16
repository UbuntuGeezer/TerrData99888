-- * CheckForDups.psq/sql - Check two databases for duplicate UnitAddress fields.
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
-- *	5/2/24.	wmk.
-- *
-- * Entry.
-- *	*rupath/Special/SawgrassN.db exists
-- *	*rupath/Special/SawgrassN.db exists
-- *	both databases have a Spec_RUBridge table of addresses
-- *
-- * Exit. any address that is duplicated is output.
-- *
-- * Modification History.
-- * ---------------------
-- * 5/2/24.	wmk.	original
-- *
-- * Notes. DoSedCheckDups.sh edits db1 and db2 to be the db names to compare.
-- *;
.open '$pathbase/DB-Dev/junk.db'
ATTACH '$pathbase/$rupath/Special/SawgrassN.db'
 as db14;
attach '$pathbase/$rupath/Special/SawgrassN.db'
 as db15;
--;
with a as (select unitaddress StreetAddr from db14.Spec_RUBridge)
SELECT * FROM DB15.Spec_RUBridge
where UnitAddress in (select StreetAddr from a);
.quit
-- * END CheckForDups.sql.
