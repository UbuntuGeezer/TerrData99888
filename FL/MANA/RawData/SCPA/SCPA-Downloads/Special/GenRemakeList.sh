#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# GenRemakeList.sh - Generate list of dbs for which to run *make* Make.<special-db>.Terr.
#	8/1/22.	wmk.
#
# Usage. bash  GenRemakeList.sh <mo> <da>
#
#	<mo> = 3-letter month abbreviation (e.g. Aug)
#	<da> = (numeric) day of month
#
# Exit. /Special/RemakeTerrList.txt = list of <special-db> names for which to run
#		 *make* -f Make.<special-db>.Terr to regenerate territories.
#
# Modification History.
# ---------------------
# 8/1/22.	wmk.	original code.
#
# Notes. Once RemakeTerrList.txt has been generated, the UpdateSpecTerrs.sh shell can
# be run to update the territories affected by the /Special .db udpates.
#
mo=$1
da=$2
if [ -z "$mo" ] || [ -z "$da" ];then
 echo "GenRemakeList <mo> <da> missing parameter(s) - abaondoned."
 exit 1
fi
ls -lh *.db > DBlhList.txt
awk '{if( $6 == "Aug" ){print $9}}' DBlhList.txt > RemakeTerrList.txt
sed -i "s?.db??g" RemakeTerrList.txt
