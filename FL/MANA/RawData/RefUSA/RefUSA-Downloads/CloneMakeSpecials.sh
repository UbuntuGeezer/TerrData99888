#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** CloneMakeSpecials.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CloneMakeSpecials.sh - Clone MakeSpecials.sql, MakeMakeSpecials from territory 235..
# 2/12/23.	wmk.
#
# Usage. bash  CloneMakeSpecials.sh  <terrid> [STD|MHP] [<src-tid>]
#
#	<terrid> = territory id to clone/Terr235/MakeSpecials.sql into
#	[STD|MHP] = (optional) STD= standard MHP= mobile home park
#	<src-tid> = (optional, mandtory if using <src-tid>) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /Terr235/MakeSpecials.psq = template of MakeSpecials.sql for cloning. 
#	          MakeMakeSpecials = makefile for cloning
#
# Dependencies.
#	MakeSpecials.psq has "endwhere" line at point where street list WHERE
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
# Notes. 
#
# set parameters P1..Pn here..
#
P1=$1		# <terrid>
P2=${2^^}	# STD|MHP
P3=$3		# <src-tid>
if [ -z "$P1" ];then
 printf "%s\n" "CloneMakeSpecials <terrid> [STD|MHP] missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 P2=MHP
else
 if [ "$P2" != "MHP" ] && [ "$P2" != "STD" ];then
  printf "%s\n" "CloneMakeSpecials <terrid> [STD|MHP] must specify STD or MHP - abandoned."
 exit 1
 fi 
fi
if [ -z "$P3" ];then
  read -p "  <src-tid> not specified - OK to use 235 (y/n)? "
 yn=${REPLY^^}
 if [ "$yn" == "Y" ];then
  P3=235
 else
  printf "%s\n" "  rerun CloneMakeSpecials <terrid> <src-tid> specifying <src-tid>.."
  exit 1
 fi
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
sed "s?$P3?$P1?g" ../Terr$P3/MakeSpecials.tmp > ../Terr$P1/MakeSpecials

if [ "$P2" == "MHP" ];then
 sed -in "/initialized for MHP territory/d" ../Terr$P1/MakeSpecials
else
 sed -in "/initialized for territory/d" ../Terr$P1/MakeSpecials
fi
printf "%s\n" " MakeSpecials.sql cloned into Terr$P1."
#endprocbody
printf "%s\n" "  CloneMakeSpecials $P1 complete."
~/sysprocs/LOGMSG "  CloneMakeSpecials $P1 complete."
# end CloneMakeSpecials.sh
