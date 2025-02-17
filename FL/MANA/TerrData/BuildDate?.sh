#!/bin/bash
# BuildDate?.sh - Get last build date for territory from BuildDates.csv.
#	9/27/23.	wmk.
#
# Modification History.
# ---------------------
# 3/15/23.	wmk.	original shell.
# 9/27/23.	wmk.	header updated.
# P1=<terrid> | null
P1=$1
if [ -z "$P1" ];then
 cat BuildDates.csv
else
 ls -lh $pathbase/TerrData/BuildDates.csv > $TEMP_PATH/scratchfile
 mawk '{print " Build date as of " $6}' $TEMP_PATH/scratchfile
 grep -e "Terr$P1" $pathbase/TerrData/BuildDates.csv
fi
# end BuildDate?
