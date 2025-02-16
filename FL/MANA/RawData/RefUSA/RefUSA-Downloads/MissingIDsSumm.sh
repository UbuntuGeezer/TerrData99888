#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# MissingIDsSumm.sh - Summary of territories with MissingIDs.
#  1/13/22.	wmk.
#
# Usage. bash  MissingIDsSumm.sh 
#
# Exit. /RefUSA-Downloads/MissingIDsList.txt = full list of MissingIDs.csv
#	files for all territories
#		Any files with length > 0 have entries output to *stdout
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/11/23.	wmk.	ver2.0 path updates; *codebase, *pathbase definitions;
#			 pushd, popd updated; header documentation expanded.
# Legacy mods.
# 1/13/22.	wmk.	original code.
#
P1=$1
#if [ -z "$P1" ];then
# 
#fi
thispath=$pathbase/$rupath
pushd ./ > /dev/null
if test -f MissingIDsList.txt;then rm MissingIDsList.txt;fi
touch MissingIDsList.txt
cd $thispath
ls -lh ./Terr*/Miss* >> MissingIDsList.txt
mawk '{if( $5 != "0" )print;;}' MissingIDsList.txt
popd > /dev/null
# end MissingIDsSumm.sh
