#!/bin/bash
# WhichTerr?.sh - Determine which territory(s) contain(s) address.
#	9/28/23.	wmk.
#
# Usage. bash  WhichTerr?.sh  <address>
#
#	<address> = address to search for within territory
#		note: address is case-sensitive and MUST have exactly 3 spaces between
#		 the number and the street. Currently "units" are not supported.
#
# Exit. list of territories output to screen.
#
# Modification History.
# ---------------------
# 9/28/23.	wmk.	code reviewed for ver2.0 compatibility.
# Legacy mods.
# 12/24/22.	wmk.	original code.
# 2/23/23.	wmk.	'Q' included in grep to avoid duplicates from Hdr files;
#			 use 'gawk' to produce sorted list.
# 3/30/23.	wmk.	rm TempList.txt before proceeding.
# 4/26/23.	wmk.	*P1 exported for *mawk; awksort.txt modified to issue
#			 message "*P1*" found in <tid>.
# P1=<address>
export P1=$1
if [ -z "$P1" ];then
 echo "WhichTerr? <address> missing parameter(s) - abandoned."
 exit 1
fi
cd $pathbase/TerrData
if test -f $TEMP_PATH/TempList.txt;then rm $TEMP_PATH/TempList.txt;fi 
if test -f $TEMP_PATH/TerrList.txt;then rm $TEMP_PATH/TerrList.txt;fi 
grep -rl -e "$P1" --include "Q*.csv" > $TEMP_PATH/TempList.txt
if [ $? -ne 0 ] || ! test -f $TEMP_PATH/TempList.txt;then
 echo "'$P1'  not found in any Territory."
 exit 0
fi
mawk '{terr_start = index($1,"QTerr");print substr($1,terr_start+5,3)}' \
 $TEMP_PATH/TempList.txt > $TEMP_PATH/TerrList.txt
gawk -f awksort.txt $TEMP_PATH/TerrList.txt
# end WhichTerr?.sh
