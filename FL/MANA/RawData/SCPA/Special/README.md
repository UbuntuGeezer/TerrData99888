README - SC-Downloads/Special documentation.<br>
11/24/22.   wmk.
###Modification History.
<pre><code>11/24/22.   wmk.   original document.
</code></pre>
<h3 id="1.0">1.0 /Special Description.</h3>
The SCPA-Downloads/Special folder contains databases that are used when building
"special" territories. These territories require extended record handling typically
because the territory shares the street with other territories. A special database
will then likely contain all the address records for the entire street, with each
territory then extracting its records from the street database.

The tools provided with the /Special folder allow coding a "tidy" query that will
modify the SCBridge records for the <special-db> to correspond with what RefUSA
and the U.S. postal system use for the address. Unfortunately this happens quite
often since the Sarasota County records often contain ambiguous situs addresses
which do not differentiate between the same number (say, 101) on different segments
of the same street (say, E or W).

In these cases the territory data administrator will need to code an SQL query
named <special-db>Tidy.sql that will differentiate the UnitAddress records that
have the same SC street address in order to make them unambiguous. The "tidy"
code will likely modify the SC address to correspond to the correct unambiguous
mailing address.
<h3 id="2.0">2.0 ForceBuild Semaphore.</h3>
The SpecialSCdb project is used to build /Special/<spec-db>db,s within the
/SCPA-Downloads folder. The assumed prerequisite for building any <spec-db>.db
is that the file <spec-db>.csv exists in the /Special folder. There are times
when the .csv file may be older than the database, but for some reason the
database needs to be regenerated. The \*make\* utility will assume that the
database is up-to-date if it is newer than the .csv download data.

The file *forcebuild* is a semaphore that can be used to force *make* of
build objects if the *forcebuild* file date is newer than the *make* target.
Typically this file is "touched" just following a major download to force
the build of all the territories' Terrxxx_SpecDB.db files. This semaphore
has required modification of all of the MakeSpecials makefiles within the
territories to enable forced builds.
<h3 id="3.0">3.0 Capri Isles Territories.</h3>
The address 649 Capri Isles Blvd W has two separate units, 87 and 124. These
units are the only units that are preserved in the SC data, since all of the
other Capri Isles Blvd W addresses are unique without using units.

