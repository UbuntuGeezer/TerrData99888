#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedAnyTIDList.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedAnyTIDList.sh - perform pre-make sed operations for Make.AnyTIDList.
# 	10/6/21.	wmk.
#
#	Usage.	DoSedAnyTIDList.sh <special-db> 
#	
#		<special-db> = special db base name (e.g. AvensCohosh)
#
#	Entry.
#		Make.AnyTIDList.tmp is template makefile for Build (wwwww is <special-db>)
#		($)HOME environment var contains the 'home' path for the system
#
#	Exit.
#		Make.AnyTIDList generated as makefile for Build/Make
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/10/21.	wmk.	original shell; adpated from DoSed for AnyTidy./
#
# Notes. DoSedAnyTIDList uses 'sed' to impose the <special-db> name into
# the Make.AnyTIDList makefile. Must be run from RefUSA-Downloads/Special folder.
#
P1=$1
if [ -z "$P1$" ];then
  printf "%s\n" "  DoSedAnyTIDList - must specify <special-db> - abandoned."
  exit 1
fi
printf "%s\n" "s?vvvvv?$P1?g" > sedatives.txt
sed -f sedatives.txt Make.AnyTIDList.tmp > Make.AnyTIDList
sed -f sedatives.txt AnyTIDList.psq > AnyTIDList.sql
printf "%s\n" "DoSedAnyTIDList complete."
# end DoSedAnyTIDList /Special
