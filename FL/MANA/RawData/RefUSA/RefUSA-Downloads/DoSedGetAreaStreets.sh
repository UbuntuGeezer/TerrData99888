#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# DoSedGetAreaStreets.sh - edit GetStreetNames.psq, MakeGetStreetNames.
#	5/23/24.	wmk.
#
# Usage. bash  DoSedGetAreaStrets.sh <area-name> <zip-code>
#
#	<area-name> = area name (e.g. Bellagio)
#	<zip-code> = zip code of area
#
# Entry. RU-Downloads/Special/MakeGetStreetNames.tmp = makefile template
#					 /Special/GetStreetNames.psq = SQL template
#
# Exit.	 MakeGetStreetNames.tmp -> MakeGetStreetNames
#		 GetStreetNames.psq   -> GetStreetNames.sql
#
# Modification History.
# ---------------------
# 5/23/24.	wmk.	original.
#
# Notes. DoSedGetAreaStreets preps the files for *make* -f MakeGetStreetNames.
# if P1 is an area-name replaced throughout
#	GetStreetNames.psq, <zip-code> is the zip code.
#	<area-name> and <zip> are the fields used in GetStreetNames.psq.
#
# P1=<area-name>, P2=<zip-code>
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "DoSedGetAreaStreets <area-name> <zip-code> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?<area-name>?$P1?g;s?<zip>?$P2?g" GetStreetNames.psq > GetStreetNames.sql
printf "%s\n" "DoSedGetAreaStrets  $P1 $P2 complete."
# end DoSedGetAreaStreets.sh.
