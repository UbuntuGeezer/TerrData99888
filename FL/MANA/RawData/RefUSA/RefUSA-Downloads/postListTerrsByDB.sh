# postListTerrsByDB.sh
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
wc -l $TEMP_PATH/DBTerrList.txt | mawk -v specdb=<spec-db> '{print specdb " used by " $1 " territories."}' >> $TEMP_PATH/DBSummary.txt
exit 0
# end postscript.
