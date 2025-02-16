#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** LsTerrDBs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# LsTerrDBs.sh - List special DB territories using *MAKE* list.
#	12/25/22.	wmk.
#
# Usage. bash  LsTerrDBs.sh <spec-db>
#
#	<spec-db> = special db name
#
# Must be run from /Special folder.
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "LsTerrDBs.sh <spec-db> missing parameter(s) - abandoned."
 printf "%s\n" "Enter ctrl-d to remain in Terminal:"
 exit 1
fi
grep -rl -e "$P1.db" --include "MakeRegenSpecDB" 
printf "%s\n" "  LsTerrDBs.sh complete."
