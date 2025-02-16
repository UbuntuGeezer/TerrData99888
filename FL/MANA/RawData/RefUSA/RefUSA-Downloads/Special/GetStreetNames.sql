-- * GetStreetNames.psq/sql - Get street names given Mirabella.
-- *	5/23/24.	wmk.
-- *
-- * Modification History.
-- * ---------------------
-- * 5/23/24.	wmk.	original.
-- *
-- * Notes. DoSed modifies this > .sql
-- *;
.open '$pathbase/$scpath/SCPA_05-20.db'
select distinct trim(substr("situsaddress(propertyaddress)",7,35)) Street
from Data0520
where parceldesc1 like '%Mirabella%'
and SitusZipCode like '34292%'
and length(Street) > 0;
.quit
-- * END GetStreetNames.sql;
