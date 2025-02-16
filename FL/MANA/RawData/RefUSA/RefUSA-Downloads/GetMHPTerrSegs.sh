#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** GetMHPTerrSegs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# <filename>.sh - <description>.
# 2/2/23.	wmk.
#
# Usage. bash  <filename>.sh
#
# Entry. 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/2/23.	wmk.	original shell (template)
#
# Notes. 
#
# set parameters P1..Pn here..
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "<filename> <mm> <dd> missing parameter(s) - abandoned."
 exit 1
fi
  printf "%s\n" "  <filename> - initiated from Make"
else
  ~/sysprocs/LOGMSG "  <filename> - initiated from Terminal"
  printf "%s\n" "  <filename> - initiated from Terminal"
fi 
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
#endprocbody
printf "%s\n" "  <filename> complete."
~/sysprocs/LOGMSG "  <filename> complete."
# end <filename>.sh
