#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# KillSQLsList.sh - Kill SQL query files using TerrSQLsList.txt.
# 9/12/23.	wmk.
#
# Usage. bash  KillSQLsList.sh [psq|sql|all]
#
#	ru|sc|all = ru for RefUSA, sc for SCPA;
#		ru - RefUSA, SC - SCPA, all - both RefUSA and SCPA
#		default = all
#
# Entry. *PWD/TerrSQLsList.txt = list of territories having at least one file
# ~ /Make.*/ 
#
# Dependencies. KillTerrMakes.sh
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/12/23.	wmk.	original shell; adapted from RefUSA.
#
# Notes. 
#
P1=$1
killpsq=0
killsql=0
case $P1 in
 "psq")
  killpsq=1
 ;;
 "sql")
  killsql=1
 ;;
 "all")
  killpsq=1
  killsql=1
 ;;
 "")
  killpsq=1
  killsql=1
 ;;
 *)
  printf "%s\n" "KillSQLsList [psq|sql|all] unrecognized '$P1' - abandoned."
  read -p "Enter ctrl-c to remain in Terminal: "
  exit 1
 ;;
esac
#	Environment vars:
if [ -z "$TODAY" ];then
 . $codebase/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
pushd ./ > /dev/null
bashpath=$codebase/Procs-Dev
projpath=$PWD
# loop on SQL territories list using KillTerrSQLs.
file=TerrSQLsList.txt
cntprocessed=0
while read -e;do
 fn=$REPLY
 frstchar=${fn:0:1}
 skip=0
 if [ -z $frstchar ] || [ $frstchar == "#" ];then		# skip blank line or hash
  skip=1
 fi
 if [ $frstchar == "\$" ];then break;fi		# dollar terminator
 printf "%s\n" "  processing $fn..."
 tn=${fn:4:99}
 $projpath/KillTerrSQLs.sh $tn $P1
 cntprocessed=$((cntprocessed+1))
#
done < $file
printf "%s\n" "  KillSQLsList $cntprocessed folders processed."
popd > /dev/null
#endprocbody
printf "%s\n" "  KillSQLsList $P1 $P2 complete."
~/sysprocs/LOGMSG "  KillSQLsList $P1 $p2 complete."
# end KillSQLsList.sh
