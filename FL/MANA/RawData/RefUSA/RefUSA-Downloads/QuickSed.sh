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
# QuickSed.sh - Quick sed fix for MHP SPECIAL files.
#	9/11/23. wmk
# RefUSA-Downloads/QuickSed.sh '../QuickSed.sh <spec-db> terrid <filename>'
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/9/21.	wmk.	original code.
# 9/11/23.	wmk.	header comments added.
#
# P1=<spec-db>, P2=terrid, P3=<filename>
p1=$1
p2=$2
p3=$3
if [ -z "$p1" ] || [ -z "$p2" ] || [ -z "$p3" ];then
 printf "%s\n" "QuickSed <spec-db> terrid <filename> missing parameter(s) - abandoned."
 exit 1
fi
sed -i "s?\$P1?$p2?g" $p3
sed -i "s?<special-db>?$p1?g" $p3
printf "%s\n" "QuickSed complete."
printf "%s\n" "  now insert contents from BayIndies&$p2.Streets.txt..."
# end QuickSed
