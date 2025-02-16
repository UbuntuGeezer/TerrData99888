#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** CloneSPECIAL.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CloneSPECIAL.sh - Clone SPECIAL.sql, MakeSPECIAL from territory *P2..
# 2/12/23.	wmk.
#
# Usage. bash  CloneSPECIAL.sh  <terrid> [<src-tid>]
#
#	<terrid> = territory id to clone/*P2/SPECIAL into
#	<src-tid> = (optional) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /Terr*P2/SPECIAL = template of SPECIAL.sql for cloning. 
#
# Dependencies.
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
 printf "%s\n" "CloneSPECIAL <terrid> <src-tid> missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 read -p "  <src-tid> not specified - OK to use 235 (y/n)? "
 yn=${REPLY^^}
 if [ "$yn" == "Y" ];then
  P2=235
 else
  printf "%s\n" "  rerun CloneSPECIAL <terrid> <src-tid> specifying <src-tid>.."
  exit 1
 fi
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
cp -pv $pathbase/$rupath/Terr$P2/SPECIAL  \
 $pathbase/$rupath/$P1
sed -i "s?$P2?$P1?g" $pathbase/$rupath/Terr$P2/SPECIAL
printf "%s\n" " SPECIAL.sql cloned into Terr$P1 from Terr$P2"
#endprocbody
printf "%s\n" "  CloneSPECIAL $P1 $P2 complete."
~/sysprocs/LOGMSG "  CloneSPECIAL $P1 $P2 complete."
# end CloneSPECIAL.sh
