#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** BuildAllStreets.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# BuildAllStreets.sh - Build all streets into SpecStreetNames6xx.sh.
#	9/9/22.	wmk.
seq 647 -1 601 > All6xxs.txt

# loop commands.
file=All6xxs.txt
while read -e;do
 TID=$REPLY
 printf "%s\n" "Adding streets for territory $TID ..."
 ./DoSedBldStreets.sh $TID
 make -f MakeBuildStreets
 ./BuildStreetsDB.sh
done < $file
printf "%s\n" "BuildAllStreets done."
# end BuildAllStreets.sh
