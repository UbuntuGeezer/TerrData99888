-- * CheckForDups.psq/sql - Check two databases for duplicate UnitAddress fields.
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
-- *	5/2/24.	wmk.
-- *
-- * Entry.
-- *	*rupath/Special/<db1>.db exists
-- *	*rupath/Special/<db2>.db exists
-- *	both databases have a Spec_RUBridge table of addresses
-- *
-- * Exit. any address that is duplicated is output.
-- *
-- * Modification History.
-- * ---------------------
-- * 5/2/24.	wmk.	original
-- *
-- * Notes. DoSedCheckDups.sh edits terr1 and terr2 to be the territories to
-- * compare.
-- *;
.open '$pathbase/DB-Dev/junk.db'
ATTACH '$pathbase/$rupath/Terr101/Terr101_RU.db'
 as db14;
attach '$pathbase/$rupath/Terr102/Terr102_RU.db'
 as db15;
--;
with a as (select unitaddress StreetAddr, Unit Unit1 from db14.Terr101_RUBridge)
SELECT * FROM db15.Terr102_RUBridge
where UnitAddress in (select StreetAddr from a
 WHERE Unit1 is Unit);
.shell echo "*rupath/101, 102 CheckForDups complete."
.quit
-- * END CheckForDups.sql.
