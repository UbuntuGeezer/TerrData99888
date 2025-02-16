#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# DwnldDates.sh - List RU download dates.
#	10/21/24.	wmk.
#
# Usage. bash   DwnldDates.sh
#
# Exit. Special/DwndlDates.csv contains list of .csv dates
#
# Modification History.
# ---------------------
# 10/21/24.	wmk.	(automated) echo,s to printf,s throughout.
# 10/21/24.	wmk.	(automated) build level 4.0.9.
# 10/21/24.	wmk.	(automated) mods for build level 4.0.9.
# 4/26/24.	wmk.	(automated) mods for build level 4.0.6.
# 11/25/24.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 3/22/23.	wmk.	original.
#
#procbodyhere
ls -lh *.csv > $pathbase/$rupath/Special/DwnldDates.txt
pushd ./ > /dev/null
gawk \
 'BEGIN{ cnt = 0 }{dates[cnt] =  $6 "  " $8;cnt++}END{m=asort(dates);for(i=0; i <= m;i++)print dates[i]}' \
 $pathbase/$rupath/Special/DwnldDates.txt > $pathbase/$rupath/Special/DwnldDates.csv
 printf "%s\n" "cat Special/DwnldDates.csv for list of download dates..."
popd > /dev/null
#endprocbody
# end DwnldDates.sh
