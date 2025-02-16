#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# BuildNewSCDB.sh - <description>.
# 2/14/23.	wmk.
#
# Usage. bash  BuildNewSCDB.sh  <terrid> <m2> <d2>
#
#	<terrid> = territory id to clone/Terr235/RegenSpecDB.sql into
#	<m2> = month of SCPA download to extract records from
#	<d2> = day of SCPA download to extract records from
#
# Entry. SC../Special/SCCreateNew.psq = template of SCCreateNew.sql for cloning. 
#	          MakeSCCreateNew = makefile for cloning
# Dependencies.
#	/Special/SCCreateNew.psq has "endwhere" line at point where street list WHERE
#	 clause to be inserted.
#
# Modification History.
# ---------------------
# 2/14/23.	wmk.	original shell.
#
# Notes. This shell is a takeoff from the CloneRegenSpecDB shell. It clones the
# code from SC/Special/SCCreateNew.psq into SC../Terryyy/SCreateNew.sql, and also
# clones the MakeSCCreateNew.tmp into MakeSCCreateNew.
#
# A subsequent " make -f MakeSCCreateNew " will rebuild SC/Terryyy/Terryyy_SC.db
# by using the segdefs.csv segment "WHERE" clause to extract records from
# SCPA_<m2><d2>.db table Data<m2><d2>.
#
P1=$1	# <terrid>
P2=$2	# <m2>
P3=$3	# <d2>
if [ -z "$P1" ];then
 echo "BuildNewSCDB <terrid> <m2> <d2> missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$folderbase" ];then
 if [ "$USER" == "ubuntu" ]; then
  folderbase=/media/ubuntu/Windows
 else
  folderbase=$HOME
 fi
fi
if [ -z "$pathbase" ];then
 export pathbase=$folderbase/Territories/FL/SARA/86777
fi
if [ -z "$codebase" ];then
 export codebase=$folderbase/GitHub/TerritoriesCB/FLsara86777
fi
if [ -z "$system_log" ]; then
  system_log=$folderbase/ubuntu/SystemLog.txt
  ~/sysprocs/LOGMSG "  BuildNewSCDB - initiated from Make"
  echo "  BuildNewSCDB - initiated from Make"
else
  ~/sysprocs/LOGMSG "  BuildNewSCDB - initiated from Terminal"
  echo "  BuildNewSCDB - initiated from Terminal"
fi 
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 . $WINGIT_PATH/TerritoriesCB/FLsara76777/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
mawk -f awkterrwhere.txt SCCreateNew.psq > ../Terr$P1/SCCreateNew.sq
sed -i "/endwhere/d" ../Terr$P1/SCCreateNew.sq
sed "s?yyy?$P1?g;s?m2?$P2?g;s?d2?$P3?g" ../Terr$P1/SCCreateNew.sq \
  > ../Terr$P1/SCCreateNew.sql
echo " almost done with BuildNewSCdb.sh..."
echo " check SC../Terr$P1/SCCreateNew.sql"
exit 0
$
sed "s?$P2?$P1?g" MakeSCCreateNew > ../Terr$P1/MakeSCCreateNew
$
echo " new SCCreateNew.sql cloned into Terr$P1 from Special."
#endprocbody
echo "  BuildNewSCDB $P1 $P2 complete."
~/sysprocs/LOGMSG "  BuildNewSCDB $P1 $P2 complete."
# end BuildNewSCDB.sh
