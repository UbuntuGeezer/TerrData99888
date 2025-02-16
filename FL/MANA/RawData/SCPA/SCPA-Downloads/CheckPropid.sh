#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CheckPropid.sh - Check if parcel ID in Terr*P2_RU.db RUBridge table.
#	4/12/23.	wmk.
P1=$1 &> $TEMP_PATH/scratchfile
P2=$2 &> $TEMP_PATH/scratchfile
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "CheckPropid <parcelid> <terrid> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?<parcel>?$P1?g;s?<tid>?$P2?g" $pathbase/$rupath/CheckParcel.psq \
  > $pathbase/$rupath/CheckParcel.sql
pushd ./ &> $TEMP_PATH/scratchfile
cd $codebase/Projects-Geany/AnySQLtoSH
./DoSed.sh $pathbase/$rupath CheckParcel &> $TEMP_PATH/scratchfile
make -f MakeAnySQLtoSH &> $TEMP_PATH/scratchfile
popd  &> $TEMP_PATH/scratchfile
$pathbase/$rupath/CheckParcel.sh
# end CheckPropid.sh
