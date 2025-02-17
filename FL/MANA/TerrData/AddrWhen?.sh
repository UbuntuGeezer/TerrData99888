#!/bin/bash
# AddrWhen?.sh - Determine when address last updated in territory.
#	3/31/24.	wmk.
#
# Usage. bash  AddrWhen?.sh  <address> <terrid>
#
#	<address> = address to search for within territory
#		note: address is case-sensitive and MUST have exactly 3 spaces between
#		 the number and the street. Currently "units" are not supported.
#
# Exit. list of territories output to screen.
#
# Modification History.
# ---------------------
# 9/27/23.	wmk.	ver2.0 improvements; echo,s replaced with printf,s.
# 3/31/24.	wmk.	SQL code modified to use new *congno, *state, *county
#			 environment vars.
# Legacy mods.
# 6/20/23.	wmk.	original code; adapted from WhichTerr?.
# Legacy mods.
# 12/24/22.	wmk.	original code.
# 2/23/23.	wmk.	'Q' included in grep to avoid duplicates from Hdr files;
#			 use 'gawk' to produce sorted list.
# 3/30/23.	wmk.	rm TempList.txt before proceeding.
# 4/26/23.	wmk.	*P1 exported for *mawk; awksort.txt modified to issue
#			 message "*P1*" found in <tid>.
# P1=<address>, P2=<terrid>
export P1=$1
export P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 echo "AddrWhen? <address> <terrid> missing parameter(s) - abandoned."
 exit 1
fi
cd $pathbase/TerrData
#procbodyhere
export scdb=_SC.db
export rudb=_RU.db
export sctable=_SCBridge
export rutable=_RUBridge
export mmtable=SplitProps
export pttable=TerrProps
printf "%s\n" ".open '$pathbase/DB-Dev/Terr$congno.db'"  > SQLTemp.sql
printf "%s\n" "-- * *P1 = 'LIKE' address to search for;"  >> SQLTemp.sql
printf "%s\n" ".mode csv"  >> SQLTemp.sql
printf "%s\n" ".separator \"|\""  >> SQLTemp.sql
printf "%s\n" ".headers off"  >> SQLTemp.sql
printf "%s\n" "SELECT 'SC data',\"Account #\" PropID,"  >> SQLTemp.sql
printf "%s\n" " \"Situs Address (Property Address)\" Situs,"  >> SQLTemp.sql
printf "%s\n" " DownloadDate SCDate"  >> SQLTemp.sql
printf "%s\n" " FROM Terr86777"  >> SQLTemp.sql
printf "%s\n" "WHERE Situs  LIKE \"$P1\";"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/$scpath/Terr$P2/Terr$P2$scdb'"  >> SQLTemp.sql
printf "%s\n" "SELECT 'TerrSC data', OwningParcel, UnitAddress, RecordDate"  >> SQLTemp.sql
printf "%s\n" " FROM Terr$P2$sctable"  >> SQLTemp.sql
printf "%s\n" " WHERE UnitAddress LIKE \"$P1\";"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/$rupath/Terr$P2/Terr$P2$rudb'"  >> SQLTemp.sql
printf "%s\n" "SELECT 'TerrRU data', OwningParcel, UnitAddress, RecordDate"  >> SQLTemp.sql
printf "%s\n" " FROM Terr$P2$rutable"  >> SQLTemp.sql
printf "%s\n" " WHERE UnitAddress LIKE \"$P1\";"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/DB-Dev/MultiMail.db'"  >> SQLTemp.sql
printf "%s\n" "SELECT 'MultiMail data', OwningParcel, UnitAddress, RecordDate"  >> SQLTemp.sql
printf "%s\n" " FROM $mmtable"  >> SQLTemp.sql
printf "%s\n" " WHERE UnitAddress LIKE \"$P1\";"  >> SQLTemp.sql
printf "%s\n" ".open '$pathbase/DB-Dev/PolyTerri.db'"  >> SQLTemp.sql
printf "%s\n" "SELECT 'PolyTerri data', OwningParcel, UnitAddress, RecordDate"  >> SQLTemp.sql
printf "%s\n" " FROM $pttable"  >> SQLTemp.sql
printf "%s\n" " WHERE UnitAddress LIKE \"$P1\";"  >> SQLTemp.sql
printf "%s\n" ".quit"  >> SQLTemp.sql
sqlite3 < SQLTemp.sql
#endprocbody
# end AddrWhen?.sh
