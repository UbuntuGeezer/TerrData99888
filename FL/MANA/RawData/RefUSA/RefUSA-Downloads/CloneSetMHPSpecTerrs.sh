#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** CloneSetMHPSpecTerrs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CloneSetMHPSpecTerrs.sh - <description>.
# 2/12/23.	wmk.
#
# Usage. bash  CloneSetMHPSpecTerrs.sh  <terrid> [<src-tid>
#
#	<terrid> = territory id to clone/Terr235/SetMHPSpecTerrs.sql into
#	<src-tid> = (optional) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /Terr235/SetMHPSpecTerrs.psq = template of SetMHPSpecTerrs.sql for cloning. 
#	          MakeSetMHPSpecTerrs = makefile for cloning
# Dependencies.
#	SetMHPSpecTerrs.psq has "endwhere" line at point where street list WHERE
#	 clause to be inserted.
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/8/23.	wmk.	original shell.
# 2/8/23	wmk.	<src-tid> parameter added.
# 2/12/23.	wmk.	default parameter handling improved; editinb corrected to 
#			 use *P2 instead of 235.
#
# Notes. other possibilities for <src-tid> 261 (Ridgewood MHP), 317 (Bay Lake MHP). 
#
# set parameters P1..Pn here..
#
P1=$1	# <terrid>
P2=$2	# <src-tid>
if [ -z "$P1" ];then
 printf "%s\n" "CloneSetMHPSpecTerrs <terrid> missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 read -p "  <src-tid> not specified - OK to use 235 (y/n)? "
 yn=${REPLY^^}
 if [ "$yn" == "Y" ];then
  P2=235
 else
  printf "%s\n" "  rerun CloneSetMHPSpecTerrs <terrid> <src-tid> specifying <src-tid>.."
  exit 1
 fi
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
mawk -f awkterrwhere.txt ../Terr$P2/SetMHPSpecTerrs.psq \
 | sed "/endwhere/d;s?$P2?$P1?g" > ../Terr$P1/SetMHPSpecTerrs.sql
sed "s?$P2?$P1?g" ../Terr$P2/MakeSetMHPSpecTerrs > ../Terr$P1/MakeSetMHPSpecTerrs
printf "%s\n" " SetMHPSpecTerrs.sql cloned into Terr$P1."
#endprocbody
printf "%s\n" "  CloneSetMHPSpecTerrs $P1 $P2 complete."
~/sysprocs/LOGMSG "  CloneSetMHPSpecTerrs $P1 $P2 complete."
# end CloneSetMHPSpecTerrs.sh
