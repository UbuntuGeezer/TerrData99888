#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** AnyTIDList.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 4/23/22.	wmk.
#	Usage. bash AnyTIDList.sh
#		
# Dependencies.
#	(leave line count the same)
#
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 4/23/22.	wmk.	modified for FL/SARA/86777.
# 4/22/22.	wmk.	HOME changed to USER in host check.
# Legacy mods.
# 4/6/21.	wmk.	original shell (template)
# 6/17/21.	wmk.	multihost support.
# 9/6/21.	wmk.	jumpto function and references removed.
# 11/9/21.	wmk.	add printf "%s\n" when initiated from make; add $ TODAY definition.
# 12/3/21.	wmk.	'procbodyhere' replaces proc body here for awk reversal.
# 4/8/22.	wmk.	HOME changed to USER in host test.	
P1=$1
TID=$P1
TN="Terr"
#	Environment vars:
if [ -z "$TODAY" ];then
 TODAY=2022-04-22
fi
NAME_BASE="Terr"
SC_DB="_SC.db"
RU_DB="_RU.db"
SC_SUFFX="_SCBridge"
RU_SUFFX="_RUBridge"

#procbodyhere

printf "%s\n" "-- AnyTIDList.psq/sql - Extract TID list from TerrList in <special-db>."  > SQLTemp.sql
printf "%s\n" "-- * 5/7/22.	wmk.	(automated) *pathbase* integration."  >> SQLTemp.sql
printf "%s\n" "--	11/10/21.	wmk."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Modification History."  >> SQLTemp.sql
printf "%s\n" "-- * ---------------------"  >> SQLTemp.sql
printf "%s\n" "-- * 11/10/21.	wmk.	original code."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Notes."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" ""  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/RawData/RefUSA/RefUSA-Downloads/Special/WaterfordNW.db'"  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers ON"  >> SQLTemp.sql
printf "%s\n" ".separator ,"  >> SQLTemp.sql
printf "%s\n" ".output '$pathbase/RawData/RefUSA/RefUSA-Downloads/Special/WaterfordNW.TIDList.txt'"  >> SQLTemp.sql
printf "%s\n" "SELECT TerrID from TerrList"  >> SQLTemp.sql
printf "%s\n" " WHERE TerrID NOTNULL"  >> SQLTemp.sql
printf "%s\n" "   AND Length(TRIM(TerrID)) > 0"  >> SQLTemp.sql
printf "%s\n" "ORDER BY TerrID;"  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" "-- ** end AnyTIDList.sql *****;"  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
printf "%s\n" "  AnyTIDList complete."
~/sysprocs/LOGMSG "  AnyTIDList complete."
#end proc
