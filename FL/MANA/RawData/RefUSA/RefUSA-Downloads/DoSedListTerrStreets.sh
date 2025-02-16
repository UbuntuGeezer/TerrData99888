#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedListTerrStreets.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedListTerrStreets.sh - edit MakeListTerrStreets.tmp, ListTerrStreets.psq.
#
# Usage. bash  DoSedListTerrStreets.sh <terrid>
#
# Entry. RU-Downloads/Special/MakeListTerrStreets.tmp = makefile template
#					 /Special/ListTerrStreets.psq = SQL template
#
# Exit.	 MakeListTerrStreets.tmp -> MakeListTerrStreets
#		 ListTerrStreets.psq   -> ListTerrStreets.sql
#		 awkterrwhere.tmp  -> awkterrwhre.txt
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/9/22.	wmk.	original code.
# Notes. DoSedListTerr Streets preps the files for *make* -f MakeListTerrStreets.
#
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "DoSedListTerrStreets <terrid> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?yyy?$P1?g" ListTerrStreets.psq > ListTerrStreets.sql
sed "s?yyy?$P1?g" ListTerrSegs.psq > ListTerrSegs.sql
sed "s?yyy?$P1?g" awkterrwhere.tmp > awkterrwhere.txt
#sed "s?xxx?$P1?g" preambleBldSt.s > preambleBldSt.sh
#
sed "s?yyy?$P1?g" MakeListTerrStreets.tmp > MakeListTerrStreets
sed "s?yyy?$P1?g" MakeListTerrSegs.tmp > MakeListTerrSegs
printf "%s\n" "DoSedListStreets  $P1 complete."
