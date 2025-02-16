#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# DoSedAnyFix.sh - perform pre-make sed operations for Make.AnyFix.
# 	10/6/21.	wmk.
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
# 12/30/21.	wmk.	original shell; adpated from DoSedAnyTidy.
#
# Notes. DoSedAnyFix uses 'sed' to impose the <special-db> name into
# the Make.AnyFix makefile.
#
P1=$1
if [ -z "$P1" ];then
  echo "  DoSedAnyFix - must specify <special-db> - abandoned."
  exit 1
fi
if [ "$USER" == "ubuntu" ]; then
   terrbase="/media/ubuntu/Windows"
   folderbase="/media/ubuntu/Windows"
else
   terrbase=$HOME
   folderbase=$HOME
fi
echo "s/vvvvv/$P1/g" > sedatives.txt
sed -f sedatives.txt Make.AnyFix.tmp > Make.AnyFix
echo "DoSedAnyFix complete."
# end DoSedAnyFix /Special
