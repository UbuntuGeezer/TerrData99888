#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# SpoofSQLS.sh - Spoof all .db csvs to fool download.
#	11/26/22.	wmk.
#
# Usage. bash SpoofSQLS.sh
#
# Exit. All special .db files have a "spoof" .sql created if one does not exits.
#	This enables ReloadSCRaw to have a "list" of .sqls to overwrite with a 
#	*tar* reload since *bash* substitutes a list wherever * occurs in a file
#	pattern.
cd $pathbase/$scpath/Special
ls *.db > SpecialDBList.txt
mawk -F "." 'BEGIN {print "#!/bin/bash"}{print "touch " $1 ".sql"}' SpecialDBList.txt \
 > TouchAllSQLs.sh
chmod +x TouchAllSQLs.sh
./TouchAllSQLs.sh
# end SpoofSQLS.sh


