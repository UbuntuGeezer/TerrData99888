#!/bin/bash
# BuildPIDList.sh - Build Property ID List.txt from OrphansIDs.csv.
#	9/28/23.	wmk.
mawk -F "|" '{print $1}' $pathbase/TerrData/OrphansIDs.csv > $pathbase/TerrData/PIDList.txt
# end BuildPIDList.sh
