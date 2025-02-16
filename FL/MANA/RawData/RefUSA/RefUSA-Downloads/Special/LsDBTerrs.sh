#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** LsDBTerrs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# LsDBTerrs.sh - List special DB territories using *MAKE* list.
#	12/21/22.	wmk.
#
# Usage. bash  LsDBTerrs.sh <spec-db>
#
#	<spec-db> = special db name
#
# Must be run from /Special folder.
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "LsDBTerrs.sh <spec-db> missing parameter(s) - abandoned."
 printf "%s\n" "Enter ctrl-d to remain in Terminal:"
 exit 1
fi
grep -e "\$(MAKE)" Make.$P1.Terr
printf "%s\n" "  LsDBTerrs.sh complete."
