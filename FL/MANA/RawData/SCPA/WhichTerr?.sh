#!/bin/bash
# WhichTerr?.sh - Determine which SC territory(s) contain(s) address.
#	5/4/24.	wmk.
#
# Usage. bash  WhichTerr?.sh  <address> [-d]
#
#	<address> = address to search for within territory
#		note: address is case-sensitive and MUST have exactly 3 spaces between
#		 the number and the street. Currently "units" are not supported.
#	-d = (optional) search within Territory Terrxxx_SC.db,s.
#
# Dependencies.
#	*pathbase/TerrData/Terrxxx/Working-Files/Q*.csv files contain .csv,s for
#	 building publisher territories.
#	if -d specified:
#	*pathbase/*scpath/Terrxxx/Terrxxx_SC.db,s present for searching
#	  Terrxxx_SCBridge tables for <address> match.
#	*TEMP_PATH/tidlist.txt contains list of territories to search within for
#	  address match; SQL 'LIKE' clause used for search.
#
# Exit. list of territories output to screen.
#
# Modification History.
# ---------------------
# 5/4/24.	wmk.	-d support added for searching internal Terrxxx_Bridge
#			 tables in $TEMP_PATH/tidlist.txt.
# 5/4/24.	wmk.	(automated) echo,s to printf,s throughout.
# 5/4/24.	wmk.	(automated) build level 4.0.8.
# 5/4/24.	wmk.	(automated) mods for build level 4.0.8.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 12/24/22.	wmk.	original code.
# 2/23/23.	wmk.	'Q' included in grep to avoid duplicates from Hdr files;
#			 use 'gawk' to produce sorted list.
# 3/30/23.	wmk.	rm TempList.txt before proceeding.
# 4/26/23.	wmk.	*P1 exported for *mawk; awksort.txt modified to issue
#			 message "*P1*" found in <tid>.
#
# P1=<address>, [P2=-d]
#
export P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "WhichTerr? <address> missing parameter(s) - abandoned."
 exit 1
fi
searchdbs=0
if [ ! -z "$P2" ];then
 if [ "$P2" == "-d" ];then
  searchdbs=1
 else
  echo "WhichTerr? <address> [-d] unrecognized parameter - abandoned."
  exit 1
 fi 
fi
#procbodyhere
pushd ./ > /dev/null
projpath=$pathbase/$scpath
cd $pathbase/TerrData
if test -f $TEMP_PATH/TempList.txt;then rm $TEMP_PATH/TempList.txt;fi 
if test -f $TEMP_PATH/TerrList.txt;then rm $TEMP_PATH/TerrList.txt;fi 
grep -rl -e "$P1" --include "Q*.csv" > $TEMP_PATH/TempList.txt
if [ $? -ne 0 ] || ! test -f $TEMP_PATH/TempList.txt;then
 printf "%s\n" "'$P1'  not found in any Territory."
 exit 0
fi
if test -s $TEMP_PATH/TempList.txt;then
 echo "The following SCPA territor(ies) have $P1 in .csv file(s)."
fi
mawk '{terr_start = index($1,"QTerr");print substr($1,terr_start+5,3)}' \
 $TEMP_PATH/TempList.txt > $TEMP_PATH/TerrList.txt
gawk -f awksort.txt $TEMP_PATH/TerrList.txt
if [ $searchdbs -ne 0 ];then
 echo "WhichTerr?.sh <address> -d - code stubbed."
 # loop on $t/tidlist.txt
 if test -f $TEMP_PATH/scratchfile;then rm $TEMP_PATH/scratchfile;fi
 filex=$TEMP_PATH/tidlist.txt
 while read -e;do
  TID=$REPLY
  frstchar=${TID:0:1}
#  # DoSedWhichTerr.sh
#  sed "s?<terrid>?$TID?g;s?<addr>?$P1?g" $projpath/WhichTerr.psq \
#   > $projpath/WhichTerr.sql
#  cat $projpath/WhichTerr.sql
  if [ "$frstchar" == "#" ];then
   printf "%s\n" "$TID" > $TEMP_PATH/scratchfile
  elif [ "$frstchar" == "\$" ];then
   break
  elif [ ${TID} -eq 0 ];then			# empty line
   printf "%s\n" "empty-line" > $TEMP_PATH/scratchfile
  else
   $projpath/DoSedWhichTerr.sh $TID "$P1"
   pushd ./ > /dev/null
   cd $codebase/Projects-Geany/AnySQLtoSH
   ./DoSed.sh $projpath WhichTerr
   make --silent -f MakeAnySQLtoSH
   popd > /dev/null
   #echo "WhichTerr.sh now ready for execution.."
   $projpath/WhichTerr.sh
  fi
 done < $filex
fi
popd > /dev/null
#endprocbody
# end WhichTerr?.sh
