#!/bin/bash
echo " ** GenTerrHTML.sh out-of-date **";exit 1
# GenTerrHTML.sh - Generate territory .html from .ods.
#	12/2/24.	wmk.
#
# Usage. bash   GenTerrHTML   <terrid>
#
#	<terrid> = territory ID
#
#	Entry Dependencies.
#   	~/TerrData/Terr<terrid>/Terr<terrid>_PubTerr.ods exists
#
#	Exit Results.
#		~/TerrData/Terr<terrid>/Terr<terrid>_PubTerr.html generated
#
# Modification History.
# ---------------------
# 12/2/24.	wmk.	(automated) build level 4.0.10.
# 12/2/24.	wmk.	original.
#
#	Notes. This shell runs a query that will fix any Bay Indies territory.
#
P1=$1
if [ -z "$P1" ]; then
  ~/sysprocs/LOGMSG "  GenTerrHTML -Territory id not specified... abandoned."
  printf "%s\n" "GenTerrHTML <terrid> missing parameter(s) - abandoned."
  exit 1
fi
~/sysprocs/LOGMSG "  GenTerrHTML started."
printf "%s\n" "  GenTerrHTML started."
TID=$P1
#procbodyhere
pushd ./ > /dev/null
for var in "$@";do
 cd $pathbase/TerrData/Terr$var
 soffice --calc --convert-to html Terr${var}_PubTerr.ods
done
popd > /dev/null
#endprocbody
# end GenTerrHTML.sh
