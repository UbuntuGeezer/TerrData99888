#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** DefineSegs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DefineSegs.sh - Define tertitory segments in TerrIDData.db.
#	2/12/23.	wmk.
#
# Usage. bash  DefineSegs.sh  <terrid>  <spec-db>
#
#	<terrid> = territory ID
#	<spec-db> = special database name (without .db suffix)
#
# Entry. *rupath/Terrxxx/segdefs.csv contains segment definitions
#
# Exit.  /DB-Dev/TerrIDData.db updated as follows:
#			Territory.Segmented = 1 for <terrid>
#			SegDefs.sqldef entries made for all segment definitions
#
#		if the LoadSegDefs process failed, the semaphore file *loadsegsfailed*
#		 will be present in the *rupath/Special folder.
#
# Dependencies.
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/2/23.	wmk.	original shell (template)
#
# Notes. DefineSegs goes through the build process for both LoadSegDefs and
# AddSegDefs.  
#
# set parameters P1..Pn here..
#
P1=$1		# terrID
P2=$2		# <spec-db>
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "DefineSegs terrid <spec-db> missing parameter(s) - abandoned."
 exit 1
fi
  printf "%s\n" "  DefineSegs - initiated from Make"
else
  ~/sysprocs/LOGMSG "  DefineSegs - initiated from Terminal"
  printf "%s\n" "  DefineSegs - initiated from Terminal"
fi 
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
pushd ./ > $TEMP_PATH/scratchfile
cd $pathbase/$rupath/Special
./DoSedLoadSegDefs.sh   $P1  $P2
make -f MakeLoadSegDefs
make -f MakeAddSegDefs
popd > $TEMP_PATH/scratchfile
#endprocbody
printf "%s\n" "  DefineSegs $P1 $P2 complete."
~/sysprocs/LOGMSG "  DefineSegs $P1 $P2 complete."
# end DefineSegs.sh# end DefineSegs.sh
