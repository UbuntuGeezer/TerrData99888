#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# DoSedCheckDups.sh - <description>.
#	5/2/24.	wmk.
#
# Usage. bash  DoSedCheckDups.sh  <db1-name>  <db2-name>
#
#	<db1-name> name of 1st db to check (*rupath/Special/<db1-name>.db)
#	<db2-name> name of 2nd db to check (*rupath/Special/<db2-name>.db)
#
# Entry. <db1-name>.db and <db2-name>.db have Spec_RUBridge table.
#
# Exit. duplicate UnitAddress fields output to Terminal.
#
# Modification History.
# ---------------------
# 4/30/24.	wmk.	original.
#
# Notes. <db1-name>.db and <db2-name>.db will likely be pieces of the same area.
# For example, SawgrassN and SawgrassS. This shell checks for addresses that
# somehow got duplicated in both databases. A future version of this may allow
# checking across publisher territories for duplicate addresses. 
#
# P1=<db1-name>, P2=<db2-name>
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 echo "DoSedCheckDups <db1-name> <db2-name> missing parameter(s) - abandoned."
 exit 1
fi
~/sysprocs/LOGMSG "  DoSedCheckDups - initiated from Terminal"
echo "  DoSedCheckDups - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
sed "s?<db1>?$P1?g;s?<db2>?$P2?g" CheckForDups.psq > CheckForDups.sql
#endprocbody
echo "  DoSedCheckDups complete."
~/sysprocs/LOGMSG "  DoSedCheckDups complete."
# end DoSedCheckDups.sh
