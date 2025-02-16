# postBldStreets.sh - BuildStreetsDB.sh postprocessor.
#	12/26/24.	wmk
errcode=$?
if [ $errcode -ne 0 ];then
 echo "run GenNewStreetNamesDB.sh to create StreetNames.db Streets table."
fi
# end postBldStreets.sh
