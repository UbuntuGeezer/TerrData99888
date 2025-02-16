-- * CheckForDups.psq/sql - Check two databases for duplicate UnitAddress fields.
. \nCheckForDups.sql-out-of-date-exiting\n
.exit 1     -- CheckForDups.sql out of-date
-- *	5/3/24.	wmk.
-- *
-- * Entry.
-- *	*scpath/Special/<db1>.db exists
-- *	*scpath/Special/<db2>.db exists
-- *	both databases have a Terrxxx_SCBridge table of addresses
-- *
-- * Exit. any address that is duplicated is output.
-- *
-- * Modification History.
-- * ---------------------
-- * 5/2/24.	wmk.	original.
-- * 5/3/24.	wmk.	echo ending message added.
-- *
-- * Notes. DoSedCheckDups.sh edits terr1 and terr2 to be the territories to
-- * compare.
-- *;
.open '$pathbase/DB-Dev/junk.db'
ATTACH '$pathbase/$scpath/Terr101/Terr101_SC.db'
 as db14;
attach '$pathbase/$scpath/Terr102/Terr102_SC.db'
 as db15;
--;
with a as (select unitaddress StreetAddr, Unit Unit1 from db14.Terr101_SCBridge)
SELECT * FROM db15.Terr102_SCBridge
where UnitAddress in (select StreetAddr from a
 WHERE Unit1 is Unit);
.shell echo "*scpath/101, 102 CheckForDups complete."
.quit
-- * END CheckForDups.sql.
