#!/bin/bash
# GenHTMLs.sh - Invoke soffice.bin to generate HTMLs.
#	2/5/25.	wmk.
#
# Usage. bash  -h|<terrid1> [<terrid2> .. <terridN>]
#
#	-h = only display GenHTMLs shell help
#	<terrid1> = territory ID for Terrxxx_PubTerr.ods conversion
#	<terrid2>..<terridN> = (optional) additional territory IDs for conversion
#
# Exit. 'soffice --convert-to html' run on all publisher territory files specified.
# It is left to the user to re-save the territory files as .pdf and with page
# formatting if that is desired.
#
# Modification History.
# ---------------------
# 2/5/25.	wmk.	-h option added.
# 2/5/25.	wmk.	(automated) build level 4.0.13.
# 12/31/24.	wmk.	use $@ to extract list of files; use '--convert-to html'
# 12/31/24.	wmk.	(automated) build level 4.0.12.
# 12/31/24	 soffice option for batch conversion.
# 12/2/24.	wmk.	original.
#
# P1 [P2..Pn]
#
P1=$1
if [ -z "$P1" ];then
 printf "%s" "GenHTMLs |-h<terr1> [<terr2> <terr3> <terr4> <terr5>]"
 printf "%s\n" " missing parameter(s) - abandoned."
 exit 1
fi
# -h option code
if [ "${P1:0:1}" == "-" ];then
 option=${P1,,}
 if [ "$option" == "-h" ];then
  printf "%s\n" "GenHTMLs - Generate PubTerrxxx.html files for territories."
  printf "%s\n" "GenHTMLs -h|<terr1> [<terr2> <terr3> <terr4> <terr5>]"
  printf "%s\n" ""
  printf "%s\n" "  -h = only display GenHTMLs shell help"
  printf "%s\n" "  <terr1> = territory 1.."
  printf "%s\n" "  <terr2> <terr3> <terr4> <terr5> = (optional) territories 2..5"
  printf "%s\n" ""
  printf "%s\n" "Results: TerrData/Terrxxx/Terrxxx_PubTerr.html files generated."
  printf "%s\n" ""
  exit 0
 else
  printf "%s" "GenHTMLs |-h<terr1> [<terr2> <terr3> <terr4> <terr5>]"
  printf "%s\n" " unrecongized option '$P1' - exiting."
  exit 1
 fi		# have -h
fi	# have -
#procbodyhere
pushd . > /dev/null
terr=Terr
fn=_PubTerr.ods
args=("$@")
nargs=${#args[@]}
#printf "%s\n" "nargs = '$nargs'"
for (( i=0; i<$nargs; i++ ));do
 TID=${args[i]}
 cd $pathbase/TerrData/$terr$TID
 printf "%s\n" "  processing territory $TID.. "
 soffice --convert-to html $terr$TID$fn 
done;
exit 0
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
 printf "%s\n" "GenpDFS <terr1> [<terr2> <terr3> <terr4> <terr5>] missing parameter(s) - abandoned."
 exit 1
fi
printf "%s\n" "GenHTMLs complete."
# end GenHTMLs.sh
