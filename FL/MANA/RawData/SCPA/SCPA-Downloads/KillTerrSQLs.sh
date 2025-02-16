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
# KillTerrSQLs.sh - Kill .psq, .sql files within territory xxx.
# 9/12/23.	wmk.
#
# Usage. bash  KillTerrSQLs.sh <terrid> [psq|sql|all]
#
#	<terrid> = territory ID for which to kill SQL queries.
#	psq|sql|all = 'psq' - kill .psq files; 'sql' - kill .sql files;
#		'all' - kill both .psq and .sql files.
#		default ='all'
#
# Entry. user in SCPA-Downloads as *PWD
#
# Dependencies. KillSQL.sh
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
# Notes. KillTerrSQLs.sh kills the queries within .psq and .sql files
# so that if sqlite3 runs the query, it terminates with the error message
# "out-of-date". If a shell that incorporates the query is rebuilt, the
# shell will terminate. This is to prevent introducing SQL queries with
# out-of-date paths back into the Territories system until they are updated with
# the correct paths and "unkilled".
#
# P1=<terrid>, P2=psq|sql|all
#
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "KillTerrSQLs <terrid> [psq|sql|all] missing parameter(s) - abandoned."
 exit 1
fi
killpsq=0
killsql=0
case $P2 in
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
  printf "%s\n" "KillTerrSQLs <terrid> [psq|sql|all] unrecognized '$P2' - abandoned."
  read -p "Enter ctrl-c to remain in Terminal: "
  exit 1
 ;;
esac
#	Environment vars:
if [ -z "$TODAY" ];then
 . $codebase/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
subpath=SCPA		# force to SCPA
#procbodyhere
pushd ./ > /dev/null
bashpath=$codebase/Procs-Dev
cd $pathbase/RawData/$subpath/$subpath-Downloads/Terr$P1
# get list of SQL files..
if test -s $TEMP_PATH/SQLFiles.txt;then rm $TEMP_PATH/SQLFiles;fi
if [ $killpsq -ne 0 ];then
  ls *.psq* >> $TEMP_PATH/SQLFiles.txt
fi
if [ $killsql -ne 0 ];then
  ls *.sql* > $TEMP_PATH/SQLFiles.txt
fi  
if ! test -s $TEMP_PATH/SQLFiles.txt;then
 printf "%s\n" "  KillTerrSQLs - no SQL files to process in Terr$P1.."
 read -p "Enter ctrl-c to remain in Terminal: "
 exit 0
fi
# loop on *make file list using KillSQL
file=$TEMP_PATH/SQLFiles.txt
while read -e;do
 fn=$REPLY
 printf "%s\n" "  processing $fn..."
 $bashpath/KillSQL.sh $fn ./
#
done < $file
popd > /dev/null
#endprocbody
printf "%s\n" "  KillTerrSQLs $P1 $P2 complete."
~/sysprocs/LOGMSG "  KillTerrSQLs $P1 $p2 complete."
# end KillTerrSQLs.sh
