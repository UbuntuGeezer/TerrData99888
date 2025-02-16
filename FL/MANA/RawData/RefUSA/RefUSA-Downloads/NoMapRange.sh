#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# NoMap600s.sh - for all 600,s territories, set NOMAP.
#	11/24/23.	wmk.
P1=$1
P2=$2
seq $P1 $P2  > $TEMP_PATH/terrlist.txt
file=$TEMP_PATH/terrlist.txt
i=0
while read -e; do
  #reading each line
  printf "%s\n" -e " processing $REPLY " >> $TEMP_PATH/scratchfile
  len=${#REPLY}
  len1=$((len-1))
  firstchar=${REPLY:0:1}
  next_one=$REPLY
#  printf "%s\n" -e "  $firstchar\n is first char of line." >> $HOME/temp/scratchfile
  #expr index $string $substring
  if [ "$firstchar" == "#" ]; then			# skip comment
   printf "%s\n" $REPLY >> $TEMP_PATH/scratchfile
  elif [ "$firstchar" == "$" ];then
   break
  else
    pushd ./ > /dev/null
    cd $pathbase/$rupath/Terr$next_one
    rm -v Map*
    fnsufx=_RU.csv
    touch Map$next_one$fnsufx
    touch NOMAP
    popd > /dev/null
  fi
  i=$((i+1))
done < $file
printf "%s\n" " $i  lines processed."

