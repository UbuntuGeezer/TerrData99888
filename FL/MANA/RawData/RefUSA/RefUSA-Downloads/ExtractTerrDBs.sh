#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# ExtractTerrDBs.sh.sh - Extract Special .db names from RegenSpecDB for any given territory.
#	11/15/24.	wmk.
#
# Usage. bash  ExtractTerrDBs.sh.sh <terrid>
#
#	<terrid> = territory ID
#
# Entry. /Special/SpecTerrDBList.txt = list of
#
# Exit. list of /Special .dbs for territory <terrid> to screen
#
# Modification History.
# ---------------------
# 11/15/24.	wmk.	(automated) echo,s to printf,s throughout.
# 11/15/24.	wmk.	(automated) build level 4.0.10.
# 11/15/24.	wmk.	(automated) mods for build level 4.0.10.
# 5/2/24.	wmk.	(automated) mods for build level 4.0.8.
# 11/25/23.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 12/22/22.	wmk.	original.
#
# P1=<terrid>
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "ExtractTerrDBs.sh <terrid> missing parameter(s) - abandoned."
 exit 1
fi
pushd ./ > /dev/null
cd $pathbase/$rupath/Terr$P1
grep -re "||.*'/.*.[a-z,A-Z][a-z,A-Z][a-z]\.db" RegenSpecDB.sql > $TEMP_PATH/regendbs.txt
cat $TEMP_PATH/regendbs.txt
#mawk -f awklistterrdbs.txt SpecTerrDBList.txt
# end ExtractTerrDBs.sh.sh
