#!/bin/bash
# idWhichTerr?.sh - Determine which territory(s) contain(s) property ID.
#	9/28/23.	wmk.
#
# Usage. bash  idWhichTerr?.sh  <propid>
#
#	<propid> = property id to search for within territory
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
#
# P1=<propid>
P1=$1
if [ -z "$P1" ];then
 echo "idWhichTerr? <propid> missing parameter(s) - abandoned."
 exit 1
fi
cd $pathbase/TerrData
if test -f $TEMP_PATH/TempList.txt;then rm $TEMP_PATH/TempList.txt;fi 
if test -f $TEMP_PATH/TempList.txt;then rm $TEMP_PATH/TerrList.txt;fi 
grep -rl -e "$P1" --include "Q*.csv" > $TEMP_PATH/TempList.txt
if [ $? -ne 0 ] || ! test -f $TEMP_PATH/TempList.txt;then
 echo "'$P1'  not found in any Territory."
 exit 0
fi
echo "$P1" > $TEMP_PATH/ThisPID.txt
mawk '{terr_start = index($1,"QTerr");print " "substr($1,terr_start+5,3)}' \
 $TEMP_PATH/TempList.txt > $TEMP_PATH/TerrList.t1
gawk -f awksort.txt $TEMP_PATH/TerrList.t1 > $TEMP_PATH/TerrList.txt
paste $TEMP_PATH/ThisPID.txt $TEMP_PATH/TerrList.txt >> $TEMP_PATH/MatchedIDList.txt
grep -e "not found" $TEMP_PATH/MatchedIDList.txt
if [ $? -eq 0 ];then
 sed -i '/not found/d' $TEMP_PATH/MatchedIDList.txt > $TEMP_PATH/MatchedIDList.t2
else
 cp -p $TEMP_PATH/MatchedIDList.txt $TEMP_PATH/MatchedIDList.t2
fi
mawk '{if(substr($1,1,1) == "0")print;}' $TEMP_PATH/MatchedIDList.t2 > $TEMP_PATH/MatchedIDList.txt
# end idWhichTerr?.sh
