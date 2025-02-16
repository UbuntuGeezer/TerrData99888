#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** ListTerrSegs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
#hdrAnySQL.sh - Any .sql to .sh shell source.
# 12/12/22.	wmk.
#	Usage. bash ListTerrSegs.sh
#		
# Dependencies.
#	(leave line count the same)
#
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 10/4/22.    wmk.   (automated) fix *pathbase for CB system.
# 12/11/22.	wmk.	run SetToday.sh to export TODAY env var.
# 12/12/22.	wmk.	SetTody.sh path corrected.
# Legacy mods.
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
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
NAME_BASE="Terr"
SC_DB="_SC.db"
RU_DB="_RU.db"
SC_SUFFX="_SCBridge"
RU_SUFFX="_RUBridge"

#procbodyhere

printf "%s\n" "-- * ListTerrSegs.psq/sql - export territory segments to Terr264Streetstxt."  > SQLTemp.sql
printf "%s\n" "-- * 2/10/23.	wmk."  >> SQLTemp.sql
printf "%s\n" "-- *"  >> SQLTemp.sql
printf "%s\n" "-- * Modification History."  >> SQLTemp.sql
printf "%s\n" "-- * ---------------------"  >> SQLTemp.sql
printf "%s\n" "-- * 2/7/23.	wmk.	original code."  >> SQLTemp.sql
printf "%s\n" "-- * 2/8/23.	wmk.	mod to write SQL \"WHERE\" snippet."  >> SQLTemp.sql
printf "%s\n" "-- * Notes."  >> SQLTemp.sql
printf "%s\n" "-- *;"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/DB-Dev/TerrIDData.db'"  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".headers off"  >> SQLTemp.sql
printf "%s\n" ".output '$pathbase/$rupath/Terr264/segdefs.csv'"  >> SQLTemp.sql
printf "%s\n" "SELECT sqldef FROM SegDefs"  >> SQLTemp.sql
printf "%s\n" " WHERE TerrID IS '264'"  >> SQLTemp.sql
printf "%s\n" " ORDER BY RecNo;"  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
printf "%s\n" "-- * END ListTerrSegss.sql;"  >> SQLTemp.sql

#endprocbody - changed from end proc body 12/3/21 for awk reversal.
# jumpto references removed 9/6/21.
sqlite3 < SQLTemp.sql
printf "%s\n" "  ListTerrSegs complete."
~/sysprocs/LOGMSG "  ListTerrSegs complete."
#end proc
