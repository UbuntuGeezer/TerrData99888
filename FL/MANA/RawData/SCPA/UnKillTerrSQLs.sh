#!/bin/bash
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
# UnKillTerrSQLs.sh - UnKill *make files within territory xxx.
# 9/12/23.	wmk.
#
# Usage. bash  UnKillTerrSQLs.sh <terrid> [psq|sql|all]
#
#	<terrid> = territory ID for which to kill Makefiles
#	psq|sql|all = psq - process .psq files; sql - process .sql files
#		all - process both .psq, .sql files; default ='all'
#
# Entry. 
#
# Dependencies.
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
# 9/12/23.	wmk.	original shell.
#
# Notes. 
#
# P1=<terrid>, P2=psq|sql|all
#
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "UnKillTerrSQLs <terrid> [psq|sql|all] missing parameter(s) - abandoned."
 exit 1
fi
unkillpsq=0
unkillsql=0
case $P2 in
 "psq")
 unkillpsq=1
 ;;
 "sql")
 unkillsql=1
 ;;
 "all")
  unkillpsq=1
  unkillsql=1
 ;;
 "")
  unkillpsq=1
  unkillsql=1
 ;;
 *)
  printf "%s\n" "UnKillTerrSQLs <terrid> [psq|sql|all] unrecognized '$P2' - abandoned."
  read -p "Enter ctrl-c to remain in Terminal: "
  exit 1
 ;;
esac
#	Environment vars:
if [ -z "$TODAY" ];then
 . $codebase/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
subpath=SCPA
#procbodyhere
pushd ./ > /dev/null
bashpath=$codebase/Procs-Dev
cd $pathbase/RawData/$subpath/$subpath-Downloads/Terr$P1
# get list of SQL files..
if test -s $TEMP_PATH/SQLFiles.txt;then rm $TEMP_PATH/SQLFiles.txt;fi
if [ $unkillpsq -ne 0 ];then
 ls *.psq >> $TEMP_PATH/SQLFiles.txt
fi
if [ $unkillsql -ne 0 ];then
 ls *.sql >> $TEMP_PATH/SQLFiles.txt
fi
if ! test -s $TEMP_PATH/SQLFiles.txt;then
 printf "%s\n" "  UnKillTerrSQLs - no SQL files to process in Terr$P1.."
 exit 0
fi
# loop on *make file list using KillMake
file=$TEMP_PATH/SQLFiles.txt
while read -e;do
 fn=$REPLY
 printf "%s\n" "  processing $fn..."
 $bashpath/UnKillSQL.sh $fn ./
#
done < $file
popd > /dev/null
#endprocbody
printf "%s\n" "  UnKillTerrSQLs $P1 $P2 complete."
~/sysprocs/LOGMSG "  UnKillTerrSQLs $P1 $p2 complete."
# end UnKillTerrSQLs.sh
