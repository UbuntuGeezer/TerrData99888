#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# BuildAllTidies.sh - Rebuild all <db-name>Tidy.sh shells.
# 9/24/23.	wmk.
#
# Usage. bash  BuildAllTidies.sh
#
# Entry. *scpath/Specials/DBList.txt = list of all /Special .db,s. 
#
# Dependencies. each /Special .db should have its own shell
#	<special-db>Tidy.sh
#
# Modification History.
# ---------------------
# 9/24/23.	wmk.	original shell.
#
# Notes. 
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
 export pathbase=$folderbase/GitHub/TerritoriesCB/FLsara86777
fi
if [ -z "$system_log" ]; then
  export system_log=$folderbase/ubuntu/SystemLog.txt
  ~/sysprocs/LOGMSG "  BuildAllTidies - initiated from Make"
  echo "  BuildAllTidies - initiated from Make"
else
  ~/sysprocs/LOGMSG "  BuildAllTidies - initiated from Terminal"
  echo "  BuildAllTidies - initiated from Terminal"
fi 
TEMP_PATH=$HOME/temp
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
if test -f $TEMP_PATH/MakeAllTidies.sh;then rm $TEMP_PATH/MakeAllTidies.sh;fi
printf "%s\n" "#!/bin/bash" > $TEMP_PATH/MakeAllTidies.sh
# for each file write ./DoSedAnyTidy.sh <db-name>
#                     make --silent -f Make.AnyTidy 
mawk -F "." '{printf ("%s%s\n%s\n","./DoSedAnyTidy.sh ", $1, "make --silent -f Make.AnyTidy")}' DBList.txt \
 >> $TEMP_PATH/MakeAllTidies.sh
chmod +x $TEMP_PATH/MakeAllTidies.sh
echo " Run *TEMP_PATH/MakeAllTidies.sh to rebuild all *Tidy.sh shells."
#endprocbody
echo "  BuildAllTidies complete."
~/sysprocs/LOGMSG "  BuildAllTidies complete."
# end BuildAllTidies.sh
