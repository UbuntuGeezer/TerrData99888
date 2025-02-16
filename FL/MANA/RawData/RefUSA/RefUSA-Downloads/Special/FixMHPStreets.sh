#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** FixMHPStreets.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# FixMHPStreets.sh - Fix MHP territory streets selection file.
#	9/11/21.	wmk.
#
# Usage. FixMHPStreets.sh <terrid> <special-db>
#
#	<terrid> = territory ID to fix streets for
#	<special-db> = [optional] special database to fix for;
#			default = BayIndies
#
# Exit.	RefUSA-Downloads/Terr<terrid>/<special-db><terrid>.Streets.txt edited
#	to have entries "WHERE UnitAddress like '%street%'
#						OR UnitAddress like '%street%'
#
P1=$1
P2=$2
if [ -z "$P1" ];then
 printf "%s\n" "** FixMHPStreets requires <terrid> parameter **"
 exit 1
fi
if [ -z "$P2" ];then
  P2=BayIndies
fi
#
 
dirbase=$folderbase/Territories/RawData/RefUSA/RefUSA-Downloads
printf "%s\n" "  FixMHPStreets $P1 $P2 initiated."
~/sysprocs/LOGMSG "  FixMHPStreets $P1 $P2 initiated."
sed -ri -f $dirbase/Special/sedex \
 $dirbase/Terr$P1/$P2$P1.Streets.txt
printf "%s\n" "FixMHPStreets $P1 $P2 complete."
~/sysprocs/LOGMSG "  FixMHPStreets $P1 $P2 complete."
