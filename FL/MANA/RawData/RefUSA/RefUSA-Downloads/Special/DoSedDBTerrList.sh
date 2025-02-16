#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# DoSedDBTerrList.sh - perform pre-make sed operations for MakeListDBTerrs.
# 	10/20/24.	wmk.
#
#	Usage.	DoSedDBTerrList.sh <spec-short> 
#	
#		<spec-short> = special db base name (e.g. AvensCohosh)
#
#	Entry.
#		MakeListDBTerrs.tmp is template makefile for Build (<spec-db> <special-db>)
#		ListDBTerrs.psq = template for ListDBTerrs.sql
#		MakeCountListDBTerrs.tmp is template makefile for Build (<spec-db> <special-db>)
#		ListCountDBTerrs.psq = template for ListCountDBTerrs.sql
#		($)HOME environment var contains the 'home' path for the system
#
#	Exit.
#		MakeListDBTerrs generated as makefile for Build/Make
#		MakeListCountDBTerrs generated as makefile for Build/Make
#
# Modification History.
# ---------------------
# 10/20/24.	wmk.	<spec-short> used for parameter description to indicate no
# 10/20/24.	 .db suffix expected.
# 10/18/24.	wmk.	ListCountDBTerrs *make and .psq added to edits.
# 10/17/24.	wmk.	(automated) echo,s to printf,s throughout.
# 10/17/24.	wmk.	(automated) build level 4.0.9.
# 10/17/24.	wmk.	(automated) mods for build level 4.0.9.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 12/20/22.	wmk.	original shell.
#
# Notes. DoSedDBTerrList uses 'sed' to impose the <special-db> name into
# the MakeListDBTerrs makefile. Must be run from RefUSA-Downloads/Special folder.
#
# P1=<spec-short>
#
P1=$1
if [ -z "$P1" ];then
  printf "%s\n" "  DoSedDBTerrList <spec-short> missing parameter(s) - abandoned."
  exit 1
fi
printf "%s\n" "s?<spec-short>?$P1?g" > sedatives.txt
sed -f sedatives.txt MakeListDBTerrs.tmp > MakeListDBTerrs
sed -f sedatives.txt MakeListCountTerrsbyDB.tmp > MakeListCountTerrsbyDB
sed -f sedatives.txt ListDBTerrs.psq > ListDBTerrs.sql
sed -f sedatives.txt ListCountTerrsbyDB.psq > ListCountTerrsbyDB.sql
sed -f sedatives.txt postListTerrsByDB.tmp > postListTerrsByDB.sh
printf "%s\n" "DoSedDBTerrList complete."
# end DoSedDBTerrList /Special
