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
# MHPdbDates.sh - Output list of MHP build dates by Territory.
#	9/11/23.	wmk.
#
# Usage. bash  MHPdbDates.sh
#
# Entry. RefUSA-Downloads/DBuildDates.txt has list of *.db file dates for
#	RefUSA-Downloads/Terrxxx folders.
#
# Exit. 
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/11/23.	wmk.	header documentation; pushd, popd updated; change to use
#			 BuildDates.txt instead of DBBuildDates.txt.
# Legacy mods.
# 4/12/23.	wmk.	original code.
#
# Notes. BuildDates.txt is created by DBBuildDates.sh.
#
pushd ./ > /dev/null
printf "%s\n" "Bay Indies build dates."
mawk \
 '$8  ~  /.*Terr23[5-9].*/ || $8  ~  /.*Terr24[0-9].*/ || $8  ~  /.*Terr251.*/  {print $6 " " $8}' \
 BuildDates.txt
mawk \
 '$8  ~  /.*Terr26[8-9].*/  {print $6 " " $8}' \
 BuildDates.txt
printf "%s\n" " "
printf "%s\n" "Ridgewood MHP build dates."
mawk \
 '$8  ~  /.*Terr26[1-4].*/  {print $6 " " $8}' \
 BuildDates.txt
printf "%s\n" " "
printf "%s\n" "BayLake MHP build dates."
mawk \
 '$8  ~  /.*Terr31[7-9].*/ || $8  ~  /.*Terr32[0-1].*/  {print $6 " " $8}' \
 BuildDates.txt
popd > /dev/null
