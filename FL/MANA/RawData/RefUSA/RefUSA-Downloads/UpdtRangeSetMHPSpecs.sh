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
# UpdtRangeSetMHPSpecs.sh - Update SetMHPSpecs files in MHP range of territories.
#	10/15/24.	wmk.
#
# Usage. bash  UpdtRangeSetMHPSpecs.sh <start-tid> <end-tid>
#
#	<start-tid> = starting territory ID for MHP
#	<end-tid> = ending territory ID for MHP
#
# Entry. 
#
# Dependencies.
#
# Exit. all SetMHPSpecTerrs.sql files updated in territory range
#	<start-tid>, <end-tid>
#
# Modification History.
# ---------------------
#	10/15/24.	wmk.	original.
#
# P1=<start-tid>, P2=<end-tid>
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 echo "UpdtRangeSetMHPSpecs <start-tid> <end-tid> missing parameter(s) - abandoned."
 exit 1
fi
~/sysprocs/LOGMSG "  UpdtRangeSetMHPSpecs - initiated from Terminal"
echo "  UpdtRangeSetMHPSpecs - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
pushd ./ > /dev/null
seq $P1 $P2 > $TEMP_PATH/tidlist.txt
b=$codebase/Procs-Dev
t=$TEMP_PATH
$b/LoopAnyShell.sh ./UpdateSetMHPSpecs.sh $t/tidlist.txt
popd > /dev/null
#endprocbody
echo "  UpdtRangeSetMHPSpecs complete."
~/sysprocs/LOGMSG "  UpdtRangeSetMHPSpecs complete."
# end UpdtRangeSetMHPSpecs.sh
