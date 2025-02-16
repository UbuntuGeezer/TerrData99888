#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# BuildMakesList.sh - Build spreadsheet from Make.*.Terr files and territories.
#	10/21/24.	wmk.
#
# Usage. bash  BuildMakesList.sh
#
# Entry. 
#
# Dependencies.
#
# Exit. /Special/MakesList.csv = .csv of dbnames and associated territories
#	as ordered pairs <dbname>,terrid
#
# Modification History.
# ---------------------
# 10/21/24.	wmk.	original.
#
~/sysprocs/LOGMSG "  BuildMakesList - initiated from Terminal"
echo "  BuildMakesList - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
b=$codebase/Procs-Dev
t=$TEMP_PATH
pushd ./ > /dev/null
cd $pathbase/$rupath/Special
ls Make.*.Terr > $t/MakeTerrsList.txt
# now loop on MakeTerrsList.txt spitting out ordered pairs of dbname,terrid
#  onto $t/MakeTerrList.csv; then invoke soffice to load .csv file
if test -f $t/dbnames.txt;then rm $t/dbnames.txt;fi
# first make list of dbnames
file=$t/MakeTerrsList.txt
while read -e;do
  echo $REPLY | mawk -F "." '{print $2}' >> $t/dbnames.txt
done < $file
cat $t/dbnames.txt
# then loop on dbnames extracting Make territories with grep
file=$t/dbnames.txt
if test -f MakesList.csv;then rm MakesList.csv;fi
while read -e;do
 echo "  processing Special db $REPLY"
 #grep -e "MAKE).*/MakeSpecials" Make.$REPLY.Terr | mawk -F "/" -v dname=$REPLY '{print dbname "," $2}' >> MakesList.csv 
 export dbname=$REPLY
 grep -e "MAKE).*/MakeSpecials" Make.$dbname.Terr > $t/theseterrs.txt
 mawk -F "/" -v dname="$REPLY" 'BEGIN{thisname=dname}{print thisname "," $2}' $t/theseterrs.txt >> MakesList.csv
done < $file
popd > /dev/null
echo "cat MakesList.csv for list."
#endprocbody
echo "  BuildMakesList complete."
~/sysprocs/LOGMSG "  BuildMakesList complete."
# end BuildMakesList.sh
