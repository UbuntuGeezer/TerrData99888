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
# KillTerrShells.sh - Kill .sh files within territory xxx.
# 9/13/23.	wmk.
#
# Usage. bash  KillTerrShells.sh <terrid> [ru|sc]
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
# 9/13/23.	wmk.	original shell; adapted from RefUSA.
#
# Notes. 
#
# P1=<terrid>
#
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "KillTerrShells <terrid> [ru|sc] missing parameter(s) - abandoned."
 exit 1
fi
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
# get list of .sh files..
ls *.sh > $TEMP_PATH/ShellFiles.txt
if ! test -s $TEMP_PATH/ShellFiles.txt;then
 printf "%s\n" "  KillTerrShells - no .sh files to process in Terr$P1.."
 read -p "Enter ctrl-c to remain in Terminal: "
 exit 0
fi
# loop on *make file list using KillMake
file=$TEMP_PATH/ShellFiles.txt
while read -e;do
 fn=$REPLY
 printf "%s\n" "  processing $fn..."
 $bashpath/KillShell.sh $fn ./
#
done < $file
popd > /dev/null
#endprocbody
printf "%s\n" "  KillTerrShells $P1 $P2 complete."
~/sysprocs/LOGMSG "  KillTerrShells $P1 $p2 complete."
# end KillTerrShells.sh
