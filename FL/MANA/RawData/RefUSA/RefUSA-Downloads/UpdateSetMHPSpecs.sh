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
# UpdateSetSpecs.sh - Update SetSpecTerrs files in <terrid>.
#	10/15/24.	wmk.
#
# Usage. bash  UpdateSetSpecs.sh <terrid>
#
#	<terrid> = RU territory ID in which to update SetSpecTerrs files.
#
# Entry. 
#
# Dependencies.
#
# Exit. files MakeSetSpecTerrs, SetSpecTerrs.sh, SetSpecTerrs.sql removed
#		files MakeSetSpecTerrs, SetSpecTerrs.sql re-initialized for territory
#
# Modification History.
# ---------------------
# 10/15/24.	wmk.	original.
#
# Notes. 
#
# P1=<terrid>
#
P1=$1
if [ -z "$P1" ];then
 echo "UpdateSetSpecs <terrid> missing parameter(s) - abandoned."
 exit 1
fi
~/sysprocs/LOGMSG "  UpdateSetSpecs - initiated from Terminal"
echo "  UpdateSetSpecs - initiated from Terminal"
#	Environment vars:
if [ -z "$TODAY" ];then
 lclp1=$P1
 . ~/sysprocs/SetToday.sh -v
 P1=$lclp1
fi
#procbodyhere
projpath=$codebase/Projects-Geany/SpecialRUdb
pushd ./ > /dev/null
cd $pathbase/$rupath/Terr$P1
rm SetMHPSpecTerrs.sh
sed -i "/-- repeat below block/,/--\*\*\*\* end/d" SetMHPSpecTerrs.sql
sed -i "2a-- * $TODAY.\twmk.\t(automated) remove MHP.db section." SetMHPSpecTerrs.sql
cat ../EndSetMHPSpecs.txt >> SetMHPSpecTerrs.sql
popd > /dev/null
#endprocbody
echo "  UpdateSetSpecs complete."
~/sysprocs/LOGMSG "  UpdateSetSpecs complete."
# end UpdateSetSpecs.sh
