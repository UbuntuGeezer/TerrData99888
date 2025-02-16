# preambleClear.sh - ClearTerrSegs preamble.
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** preambleClear.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#	2/15/23.	wmk.
printf "%s\n" "WARNING: you are about to clear the segment definitions"
read -p " for territory 264... continue (y/n)? "
yn=${REPLY^^}
if [ "$yn" == "N" ];then
 printf "%s\n" "  Review TerrID.db segment definitions for territory $P1."
 printf "%s\n" "   ClearTerrSegs abandoned at user request."
 exit 1
else
 printf "%s\n" "  Proceeding to clear segment definitions for territory $P1... "
fi
# end preambleClear.sh
