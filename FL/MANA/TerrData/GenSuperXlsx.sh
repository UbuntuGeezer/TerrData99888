#!/bin/bash
# GenSuperXlsx.sh - Generate Terrxxx_SuperTerr.xlsx from .ods.
#	6/4/24.	wmk.
#
# Usage. bash  GenSuperXlsx.sh terr1 terr2 terr3 terr4 terr5
#
# Entry. 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 6/4/24.	wmk.	original.
#
# Notes. 
#
# P1=terr1,[P2=terr2, P3=terr3, P4=terr4, P5=terr5
#
P1=$1
P2=$2
P3=$3
P4=$4
P5=$5
~/sysprocs/LOGMSG "  GenSuperXlsx - initiated from Terminal"
echo "  GenSuperXlsx - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
terr=Terr
fn=_SuperTerr.ods
if [ ! -z "$P5" ];then
 soffice $terr$P1/$terr$P1$fn  $terr$P2/$terr$P2$fn $terr$P3/$terr$P3$fn $terr$P4/$terr$P4$fn \
   $terr$P5/$terr$P5$fn
elif [ ! -z "$P4" ];then
 soffice $terr$P1/$terr$P1$fn  $terr$P2/$terr$P2$fn $terr$P3/$terr$P3$fn $terr$P4/$terr$P4$fn
elif [ ! -z "$P3" ];then
 soffice $terr$P1/$terr$P1$fn  $terr$P2/$terr$P2$fn $terr$P3/$terr$P3$fn
elif [ ! -z "$P2" ];then
 soffice $terr$P1/$terr$P1$fn  $terr$P2/$terr$P2$fn
elif [ ! -z "$P1" ];then
 soffice $terr$P1/$terr$P1$fn
else
 echo "GenSuperXlsx <terr1> [<terr2> <terr3> <terr4> <terr5>] missing parameter(s) - abandoned."
 exit 1
fi
#endprocbody
echo "  GenSuperXlsx complete."
~/sysprocs/LOGMSG "  GenSuperXlsx complete."
# end GenSuperXlsx.sh
