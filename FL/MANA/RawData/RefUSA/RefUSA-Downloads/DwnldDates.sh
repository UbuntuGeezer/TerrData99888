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
# DwnldDates.sh - List RU download dates.
#	3/21/23.	wmk.
#
# Modificaton History.
# --------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 3/21/23.	wmk.	original code.
# 11/24/23.	wmk.	use awkdwnlddates for gawk; pushd, popd updated.
#
# Notes. DwnldDates.txt is ls -lh output.
# field 6 is date, field 8 is filepath
ls -lh Terr*/Map*.csv > $pathbase/$rupath/DwnldDates.txt
pushd ./ > /dev/null
gawk -f awkdwnlddates.txt DwnldDates.txt > DwnldDates.csv
 printf "%s\n" "cat DwnldDates.csv for list of download dates..."
popd > /dev/null
