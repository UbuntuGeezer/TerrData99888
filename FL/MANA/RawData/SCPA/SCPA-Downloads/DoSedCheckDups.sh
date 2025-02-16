#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# DoSedCheckDups.sh - *sed CheckForDups.sql > CheckForDups.sql .
#	5/2/24.	wmk.
#
# Usage. bash  DoSedCheckDups.sh  <terr1>  <terr2>
#
#	<terr1> = first territory to check (*rupath/Terr<terr1>_RU.db)
#	<terr2> = second territory to check (*rupath/Terr<terr2>_RU.db)
#
# Entry. both Terr<tid>_RU.db have Spec_RUBridge table.
#
# Exit. CheckForDups.psq > CheckForDups.sql.
#
# Modification History.
# ---------------------
# 5/2/24.	wmk.	original.
#
# P1=<terr1>, P2=<terr2>
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "DoSedCheckDups <terr1> <terr2> missing parameter(s) - abandoned."
 exit 1
fi
~/sysprocs/LOGMSG "  DoSedCheckDups - initiated from Terminal"
printf "%s\n" "  DoSedCheckDups - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
sed "s?<terr1>?$P1?g;s?<terr2>?$P2?g" CheckForDups.psq > CheckForDups.sql
#endprocbody
printf "%s\n" "  DoSedCheckDups complete."
~/sysprocs/LOGMSG "  DoSedCheckDups complete."
# end DoSedCheckDups.sh
