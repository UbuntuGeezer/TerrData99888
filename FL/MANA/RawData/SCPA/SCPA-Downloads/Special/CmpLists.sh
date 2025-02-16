#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# CmpLists.sh - Compare DBList with TerrMakeList.
# 5/5/23.	wmk.
#
# Usage. bash  CmpLists.sh
#
# Entry.	SCPA-Downloads/Special/DBList.txt = list of /Special SC databases
#			SCPA-Downloads/Special/TerrMakeList = list of /Special Make.<spec-db>.Terr files 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 2/2/23.	wmk.	original shell (template)
#
# Notes. 
#
# set parameters P1..Pn here..
#
if [ -z "$folderbase" ];then
 if [ "$USER" == "ubuntu" ]; then
  export folderbase=/media/ubuntu/Windows
 else
  export folderbase=$HOME
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
  ~/sysprocs/LOGMSG "  CmpLists - initiated from Make"
  echo "  CmpLists - initiated from Make"
else
  ~/sysprocs/LOGMSG "  CmpLists - initiated from Terminal"
  echo "  CmpLists - initiated from Terminal"
fi 
echo "  comparing DBList.txt with MakeList.txt..."
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 . $WINGIT_PATH/TerritoriesCB/FLsara76777/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
pushd ./ > /dev/null
cd $pathbase/$scpath/Special
#awk -F "." '{print "grep -e \" MakeList.txt" $2  "> scratchfile;if test -s scratchfile;then echo \"$2 not in TerrMakeList.txt\";fi"}' DBList.txt > $TEMP_PATH/MakeList.sh
#awk -F "." '{print "grep -e \"" $2  "\" TerrMakeList.txt > scratchfile;if test -s scratchfile;then echo \"$2 not in TerrMakeList.txt\";fi"}' DBList.txt > $TEMP_PATH/MakeList.sh
mawk -F "." -f awkcmplist.txt DBList.txt > $TEMP_PATH/MakeList.sh
#diff -s DBList.txt $TEMP_PATH/MakeList.txt 
chmod +x $TEMP_PATH/MakeList.sh
$TEMP_PATH/MakeList.sh
popd  > /dev/null
#endprocbody
echo "  CmpLists complete."
~/sysprocs/LOGMSG "  CmpLists complete."
# end CmpLists.sh
