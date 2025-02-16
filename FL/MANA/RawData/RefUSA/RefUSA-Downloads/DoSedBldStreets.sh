#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# DoSedBldStreets.sh - edit MakeBldStreets.tmp, BuildStreetsDB.psq.
#	12/26/24.	wmk.
#
# Usage. bash  DoSedBldStreets.sh <terrid>|<spec-db>
#
#	<terrid>|<spec-db> = territory ID or /Special.db to add entries for
#
# Entry. RU-Downloads/Special/MakeBuildStreets.tmp = makefile template
#					 /Special/BuildStreetsDB.psq = SQL template
#
# Exit.	 MakeBldStreets.tmp -> MakeBldStreets
#		 BuildStreetsDB.psq   -> BuildStreetsDB.sql
#		 MakeBldSpecStreets.tmp -> MakeBldSpecStreets
#		 BuildSpecStreetsDB.psq -> BuildSpecStreetsDB.sql
#
# Modification History.
# ---------------------
# 12/26/24.	wmk.	add BuildSpecStreetsDB.psq, MakeBldSpecStreets.tmp to edit
# 12/26/24.	 list for processing /Special dbs.
# 12/26/24.	wmk.	(automated) build level 4.0.12.
# 5/2/24.	wmk.	(automated) printf "%s\n",s to printf,s throughout.
# 5/2/24.	wmk.	(automated) build level 4.0.8.
# 5/2/24.	wmk.	(automated) mods for build level 4.0.8.
# 5/2/24.	wmk.	P1 changed to allow either a terrid or spec-db.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# Legacy mods.
# 9/9/22.	wmk.	original code.
#
# Notes. DoSedBldStreets preps the files for *make* -f MakeBldStreets.
# if P1 is a territory ID xxx is replaced with P1 throughout
#	BldStreetsDB.psq
#
# if P1 is a <spec-db>, /Terrxxx/ is replaced with /Special/,
#	 Terrxxx_RU.db is replaced with <spec-db>.db, Terrxxx_SC.db is replaced with
#	 <spec-db>.db, Terrxxx_SCBridge is replaced with Spec_SCBridge, and
#	 Terrxxx_RUBridge is replaced with Spec_RUBridge throughout
#	 BuildStreetsDB.psq.
# sedbldstreets.txt
# s?/Terrxxx/Special/?g
# s?Terrxxx_RU.db?$P1.db?g
# s?Terrxxx_SC.db?$P1.db?g
# s?Terrxxx_RUBridge?Spec_RUBridge?g
# s?Terrxxx_SCBridge?Spec_SCBridge?g
# s?*scpath/?*scpath/Special/?g
# s?*rupath/?*rupath/Special/?g
#
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "DoSedBldStreets <terrid>|<spec-db> missing parameter(s) - abandoned."
 exit 1
fi
# set isspec=0 if P1 starts with a digit.
isspec=1
if [[ $P1 =~ [0-9].* ]];then
 isspec=0
fi
if [ $isspec -eq 0 ];then
 sed "s?xxx?$P1?g" BuildStreetsDB.psq > BuildStreetsDB.sql
 sed "s?xxx?$P1?g" preambleBldSt.s > preambleBldSt.sh
#
 sed "s?yyy?$P1?g" MakeBldStreets.tmp > MakeBldStreets
else	# is /Special db
 #printf "%s\n" " DoSedBldStreets <spec-db> stubbed, MakeBuildStreets unchanged."
 sed "s?<spec-db>?$P1?g" BldSpecStreetsDB.psq > BldSpecStreetsDB.sql
 sed "s?<spec-db>?$P1?g" MakeBldSpecStreetsDB.tmp > MakeBldSpecStreetsDB
fi	# end *isspec conditional
printf "%s\n" "DoSedBldStreets  $P1 complete."
