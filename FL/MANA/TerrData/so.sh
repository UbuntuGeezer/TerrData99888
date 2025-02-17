#!/bin/bash
# so - soffice.bin shortcut for up to 5 territories.
#	3/11/23.	wmk.
#
# Modification History.
# ---------------------
# 3/11/23.	wmk.	original shell.
# 9/27/23.	wmk.	improved for all Chromebook systems; use 'soffice' command;
#			 pushd, popd updated.
P1=$1
P2=$2
P3=$3
P4=$4
P5=$5
if [ -z "$P1" ];then
 echo "so <terr1> [<terr2> <terr3> <terr4> <terr5>] missing parameter(s) - abandoned."
 exit 1
fi
pubterr=_PubTerr.ods
pushd ./ > /dev/null
cd $pathbase/TerrData
if [ ! -z "$P5" ];then
 soffice Terr$P1/Terr$P1$pubterr Terr$P2/Terr$P2$pubterr \
  Terr$P3/Terr$P3$pubterr Terr$P4/Terr$P4$pubterr Terr$P5/Terr$P5$pubterr
 popd >  /dev/null
 exit 0
fi
if [ ! -z "$P4" ];then
 soffice Terr$P1/Terr$P1$pubterr Terr$P2/Terr$P2$pubterr \
  Terr$P3/Terr$P3$pubterr Terr$P4/Terr$P4$pubterr
 popd >  /dev/null
 exit 0
fi
if [ ! -z "$P3" ];then
 soffice Terr$P1/Terr$P1$pubterr Terr$P2/Terr$P2$pubterr \
  Terr$P3/Terr$P3$pubterr
 popd >  /dev/null
 exit 0
fi
if [ ! -z "$P2" ];then
 soffice Terr$P1/Terr$P1$pubterr Terr$P2/Terr$P2$pubterr
 popd >  /dev/null
 exit 0
fi
soffice Terr$P1/Terr$P1$pubterr
popd >  /dev/null
exit 0
# end so.sh
