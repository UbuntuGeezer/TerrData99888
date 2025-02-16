#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedAnyFix.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedAnyFix.sh - perform pre-make sed operations for Make.AnyFix.
# 	9/9/22.	wmk.
#
#	Usage.	DoSedAnyFix.sh <special-db> 
#	
#		<special-db> = special db base name (e.g. Esplanade811_333)
#
#	Entry.
#		Make.AnyFix.tmp is template makefile for Build (wwwww is <special-db>)
#		($)HOME environment var contains the 'home' path for the system
#
#	Exit.
#		Make.AnyFix generated as makefile for Build/Make
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/9/22.	wmk.	*pathbase integration; shell update; bug fix in parameter check.
# Legacy mods.
# 10/28/21.	wmk.	original shell; adpated from DoSedAnyTidy.
#
# Notes. DoSedAnyFix uses 'sed' to impose the <special-db> name into
# the Make.AnyFix makefile. Must be run from RefUSA-Downloads/Special folder.
#
P1=$1
if [ -z "$P1" ];then
  printf "%s\n" "  DoSedAnyFix - must specify <special-db> - abandoned."
  exit 1
fi
terrbase=$folderbase
printf "%s\n" "s/wwwww/$P1/g" > sedatives.txt
sed -f sedatives.txt Make.AnyFix.tmp > Make.AnyFix
printf "%s\n" "DoSedAnyFix complete."
# end DoSedAnyFix /Special
