#!/bin/bash
echo " ** GenPDFs.sh out-of-date **";exit 1
# GenPDFs.sh - Invoke soffice.bin to generate PDFs.
#	9/27/23.	wmk.
#
# Usage. bash  GenPDFs.sh Terrxxx_PubTerr.xlsx ... Terrxxx5_PubTerr.xlsx
#
#	Terrxxx1..Terrxxx5_PubTerr.xlsx = publisher territories from ProcessQTerr12.ods
#
# Exit. soffice run on all publisher territory files specified.
# It is left to the user to re-save the territory files as .pdf and with page
# formatting.
P1=$1
P2=$2
P3=$3
P4=$4
P5=$5
terr=Terr
fn=_PubTerr.xlsx
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
 echo "GenpDFS <terr1> [<terr2> <terr3> <terr4> <terr5>] missing parameter(s) - abandoned."
 exit 1
fi
echo "GenPDFs complete."
# end GenPDFs.sh
