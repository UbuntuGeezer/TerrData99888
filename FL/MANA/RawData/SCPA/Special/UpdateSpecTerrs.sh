#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# UpdateSpecTerrs.sh - Run *make* Make.<special-db>.Terr for territories in RemakeTerrList.txt.
#	8/1/22.	wmk.
#
# Usage. bash  UpdateSpecTerrs.sh
#
# Entry. RemakeTerrList.txt = list of <special-db>,s for which to remake territories.
#
# Exit.  *make* -f Make.<special-db>.Terr run for all <special-db> names in
#		  RemakeListTerr.txt.
error_counter=0		# set error counter to 0
IFS="&"			# set & as the word delimiter for read.
file=RemakeTerrList.txt
while read -e; do
  #reading each line
  echo -e " processing $REPLY " >> /dev/null
  len=${#REPLY}
  len1=$((len-1))
  firstchar=${REPLY:0:1}
#  echo -e "  $firstchar\n is first char of line." >> $HOME/temp/scratchfile
  #expr index $string $substring
  if [ "$firstchar" == "#" ]; then			# skip comment
   echo $REPLY >> $HOME/temp/scratchfile
  else
   spec_db=${REPLY:0:len}
   if [ 1 -eq 1 ];then
    if test -f Make.$spec_db.Terr;then
     make -f Make.$spec_db.Terr
    else
     echo " ** WARNING - Make.$spec_db.Terr not found **" >> $TEMP_PATH/MakeErrors.txt
    fi
   else
    echo "make -f Make.$spec_db.Terr (test)"
   fi
  fi     # end is comment line conditional

i=$((i+1))
done < $file
echo " $i RemakeList.txt lines processed."
if [ $error_counter = 0 ]; then
  if test -f $TEMP_PATH/MakeErrors.txt;then rm $TEMP_PATH/MakeErrors.txt;fi
else
  echo "  $error_counter errors encountered - check $TEMP_PATH/MakeErrors.tx "
fi
bash ~/sysprocs/LOGMSG " UpdateSpecTerrs complete." >> $system_log
echo " 	UpdateSpecTerrs complete."
#end UpdateSpecTerrs proc.
