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
# UnKillShellsList.sh - UnKill .sh files using TerrMakesList.txt.
# 9/12/23.	wmk.
#
# Usage. bash  UnKillShellsList.sh [ru|sc]
#
#	ru|sc = ru for RefUSA, ru for SCPA; default = ru
#
# Entry. *PWD/TerrShellsList.txt = list of territories having at least one file
# ~ /*.sh/ 
#
# Dependencies. KillTerrMakes.sh
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 9/12/23.	wmk.	original shell.
#
# Notes. 
#
P1=$1
case $P1 in
 "ru")
 subpath=RefUSA
 ;;
 "sc")
 subpath=SCPA
 ;;
 "")
 subpath=RefUSA
 ;;
 *)
  printf "%s\n" "UnKillShellsList [ru|sc] unrecognized '$P1' - abandoned."
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
cd $pathbase/$subpath/$subpath-Downloads
ls -lh > $TEMP_PATH/FullList.txt
mawk '{if(substr($1,1,1) == "d")print $8;;}' $TEMP_PATH/FullList.txt > $TEMP_PATH/NamesList.txt
gawk 'BEGIN{cnt=0}END{ncnt=asort(dirlist,sortdlist);for(i=0;i<=ncnt;i++){if(substr(sortdlist[i],1,4) == "Terr")print sortdlist[i]};;}{dirlist[cnt]=$1;cnt++}' $TEMP_PATH/NamesList.txt > TerrShellsList.txt
# loop on *make file list using KillMake
file=TerrShellsList.txt
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
 $projpath/UnKillTerrShells.sh $tn $P1
 cntprocessed=$((cntprocessed+1))
#
done < $file
printf "%s\n" "  UnKillShellsList $cntprocessed folders processed."
popd > /dev/null
#endprocbody
printf "%s\n" "  UnKillShellsList $P1 $P2 complete."
~/sysprocs/LOGMSG "  UnKillShellsList $P1 $p2 complete."
# end UnKillShellsList.sh
