#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** CloneRegenSpecDB.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CloneRegenSpecDB.sh - <description>.
# 2/12/23.	wmk.
#
# Usage. bash  CloneRegenSpecDB.sh  <terrid> [<src-tid>]
#
#	<terrid> = territory id to clone/Terr235/RegenSpecDB.sql into
#	<src-tid> = (optional) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /Terr235/RegenSpecDB.psq = template of RegenSpecDB.sql for cloning. 
#	          MakeRegenSpecDB = makefile for cloning
# Dependencies.
#	RegenSpecDB.psq has "endwhere" line at point where street list WHERE
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
# Notes. other possibilities for <src-tid> 261 (Ridgewood MHP), 317 (Bay Lake MHP). 
# Support now added for "segmented" territory definitions (like BayIndiesMHP terr 251).
#
P1=$1	# <terrid>
P2=$2	# <src-tid>
if [ -z "$P1" ];then
 printf "%s\n" "CloneRegenSpecDB <terrid> [<src-tid>]missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 read -p "  <src-tid> not specified - OK to use 235 (y/n)? "
 yn=${REPLY^^}
 if [ "$yn" == "Y" ];then
  P2=235
 else
  printf "%s\n" "  rerun CloneRegenSpecDB <terrid> <src-tid> specifying <src-tid>.."
  exit 1
 fi
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
mawk -f awkterrwhere.txt ../Terr$P2/RegenSpecDB.psq \
 | sed "/endwhere/d;s?$P2?$P1?g" > ../Terr$P1/RegenSpecDB.sql
sed "s?$P2?$P1?g" ../Terr$P2/MakeRegenSpecDB > ../Terr$P1/MakeRegenSpecDB
printf "%s\n" " RegenSpecDB.sql cloned into Terr$P1 from Terr$P2."
#endprocbody
printf "%s\n" "  CloneRegenSpecDB $P1 $P2 complete."
~/sysprocs/LOGMSG "  CloneRegenSpecDB $P1 $P2 complete."
# end CloneRegenSpecDB.sh
