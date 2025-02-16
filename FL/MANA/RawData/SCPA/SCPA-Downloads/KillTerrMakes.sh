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
# KillTerrMakes.sh - Kill *make files within territory xxx.
# 9/11/23.	wmk.
#
# Usage. bash  KillTerrMakes.sh <terrid> [ru|sc]
#
#	<terrid> = territory ID for which to kill Makefiles
#	ru|sc = 'ru' or 'sc' for which type;
#		default ='sc'
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
# 9/12/23.	wmk.	original shell; adapted from RefUSA.
#
# Notes. 
#
# P1=<terrid>, P2=ru|sc
#
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "KillTerrMakes <terrid> [ru|sc] missing parameter(s) - abandoned."
 exit 1
fi
case $P2 in
 "ru")
 subpath=RefUSA
 ;;
 "sc")
 subpath=SCPA
 ;;
 "")
 subpath=SCPA
 ;;
 *)
  printf "%s\n" "KillTerrMakes <terrid> [ru|sc] unrecognized '$P2' - abandoned."
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
cd $pathbase/RawData/$subpath/$subpath-Downloads/Terr$P1
# get list of Make files..
ls Make* > $TEMP_PATH/MakeFiles.txt
if ! test -s $TEMP_PATH/MakeFiles.txt;then
 printf "%s\n" "  KillTerrMakes - no *make files to process in Terr$P1.."
 read -p "Enter ctrl-c to remain in Terminal: "
 exit 0
fi
# loop on *make file list using KillMake
file=$TEMP_PATH/MakeFiles.txt
while read -e;do
 fn=$REPLY
 printf "%s\n" "  processing $fn..."
 $bashpath/KillMake.sh $fn ./
#
done < $file
popd > /dev/null
#endprocbody
printf "%s\n" "  KillTerrMakes $P1 $P2 complete."
~/sysprocs/LOGMSG "  KillTerrMakes $P1 $p2 complete."
# end KillTerrMakes.sh
