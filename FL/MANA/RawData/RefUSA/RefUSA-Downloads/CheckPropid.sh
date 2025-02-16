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
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 2023-10-06   wmk.   (automated) ver2.0 path fixes.
# CheckPropid.sh - Check if parcel ID in Terr*P2_RU.db RUBridge table.
#	4/12/23.	wmk.
#	10/6/23.	wmk.	reinstate $TEMP_PATH/scratchfile target for errors.
P1=$1 &> $TEMP_PATH/scratchfile
P2=$2 &> $TEMP_PATH/scratchfile
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "CheckPropid <parcelid> <terrid> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?<parcel>?$P1?g;s?<tid>?$P2?g" $pathbase/$rupath/CheckParcel.psq \
  > $pathbase/$rupath/CheckParcel.sql
pushd ./ > /dev/null
cd $codebase/Projects-Geany/AnySQLtoSH
./DoSed.sh $pathbase/$rupath CheckParcel &> /dev/null
make -f MakeAnySQLtoSH &> $TEMP_PATH/scratchfile
popd  > /dev/null
$pathbase/$rupath/CheckParcel.sh
# end CheckPropid.sh
