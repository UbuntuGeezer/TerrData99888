#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# DwnldDates.sh - List RU download dates.
#	4/28/24.	wmk.
#
# Modification History.
# ---------------------
# 4/28/24.	wmk.	(automated) echo,s to printf,s throughout.
# 4/28/24.	wmk.	(automated) build level 4.0.6.
# 4/28/24.	wmk.	(automated) mods for build level 4.0.6.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 3/21/23.	wmk.	original code.
# 9/11/23.	wmk.	pushd, popd updated.
#
ls -lh Terr*/Map*.csv > $pathbase/$scpath/DwnldDates.txt
pushd ./ > /dev/null
gawk \
 'BEGIN{ cnt = 0 }{dates[cnt] =  $6 "  " $8;cnt++}END{m=asort(dates);for(i=0; i <= m;i++)print dates[i]}' \
 DwnldDates.txt > DwnldDates.csv
 printf "%s\n" "cat DwnldDates.csv for list of download dates..."
 printf "%s\n" " or use LibreOffice/Calc to place in spreadsheet."
popd > /dev/null
# end DwnldDates.sh
