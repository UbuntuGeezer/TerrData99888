#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# ListTerrDBs.sh - list RU Special .dbs for any given territory.
#	2/9/25.	wmk.
#
# Usage. bash  ListTerrDBs.sh -h|<terrid> [segs|terr|make]
#
#	-h = only display ListTerrDBs shell help
#	<terrid> = territory ID
#	terr|make = from territory or Special/Makes source
#				default = make
#
# Entry. /Special/Make.<spec-db>.Terr files contain *make lists of
#	territories using <spec-db>
#
# Exit. list of /Special .dbs for territory <terrid> to screen
#
# Modification History.
# ---------------------
# 2/9/25.	wmk.	-h option added.
# 2/9/25.	wmk.	(automated) build level 4.0.13.
# 12/25/24.	wmk.	add check of segdefs.csv if exists.
# 12/25/24.	wmk.	(automated) build level 4.0.12.
# 11/15/24.	wmk.	(automated) printf "%s\n",s to printf,s throughout.
# 11/15/24.	wmk.	(automated) build level 4.0.10.
# 11/15/24.	wmk.	(automated) mods for build level 4.0.10.
# 10/18/24.	wmk.	terr|make command line option added.
# 10/17/24.	wmk.	(automated) mods for build level 4.0.9.
# 10/17/24	wmk.	code improved to go directly to Terr<terrid> folder.
# 5/2/24.	wmk.	(automated) mods for build level 4.0.8.
# 11/25/23.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# 12/22/22.	wmk.	original.
#
# Notes. if 'terr is selected, RU/Terrxxx/RegenSpecDB is used to extract the
# list of Special dbs. if 'make is selected, Special/Make.<spec-db>.Terr files
# are scanned to extract the list of Special dbs.
#
# P1=<terrid>, P2=terr|make
#
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "ListTerrDBs -h|<terrid> [terr|make] missing parameter(s) - abandoned."
 exit 1
fi
# -h option code
if [ "${P1:0:1}" == "-" ];then
 option=${P1,,}
 if [ "$option" == "-h" ];then
  printf "%s\n" "ListTerrDBs - List all /Special db,s used by territory."
  printf "%s\n" "ListTerrDBs -h|<terrid> [segsterr|make]"
  printf "%s\n" ""
  printf "%s\n" "  -h = only display ListTerrDBs shell help"
  printf "%s\n" "  <terrid> = territory ID"
  printf "%s\n" "  terr|make = (optional) list source for db names"
  printf "%s\n" "     terr = extract names from RU/Terr<terrid>/RegenSpec.sql,segdef*.csv"
  printf "%s\n" "     make = extract names from RU/Special/Make.<spec-db>.Terr files"
  printf "%s\n" "      default = make"
  printf "%s\n" ""
  printf "%s\n" "Results: list of /Special db,s used by territory <terrid> displayed"
  printf "%s\n" ""
  exit 0
 else
  printf "%s\n" "ListTerrDBs -h|<terrid> [segsterr|make]  unrecognized option '$P1' - exiting."
  exit 1
 fi		# have -h
fi	# have -

if [ -z "$P2" ];then
 P2=make
fi
#procbodyhere
pushd ./ > /dev/null
case "$P2" in
 "make")
 cd $pathbase/$rupath/Special
 grep -rle "MAKE).*Terr$P1/MakeSpecials" --include "Make.*.Terr"
 ;;
 "terr")
   cd $pathbase/$rupath/Terr$P1
   if test -f RegenSpecDB.sql;then
     grep -e "||.*[a-z,A-Z][a-z,A-Z][a-z,A-Z]\.db" RegenSpecDB.sql
   fi
   ls -lh segdef*.csv 1>$TEMP_PATH/terrsegs.txt 2>$TEMP_PATH/terrsegs.txt
    if [ $? -eq 0 ];then
     #cat $TEMP_PATH/terrsegs.txt
     # loop on *t/terrsegs.txt, all but last file
     mawk  '{print $NF}' $TEMP_PATH/terrsegs.txt \
      > $TEMP_PATH/terrsegs.lst
     #cat $TEMP_PATH/terrsegs.lst
     cnt=$(wc -l $TEMP_PATH/terrsegs.lst)
     cnt=${cnt:0:2}
     # reduce count if > 1
     if [ $cnt -gt 1 ];then
      cnt=$(($cnt-1))
     fi
     #echo " cnt = $cnt"
     file=$TEMP_PATH/terrsegs.lst
     nread=0
     while read -e;do
      fn=$REPLY
      if [ $nread -eq $cnt ];then break;fi
      nread=$((nread+1))
      mawk -F "|" '{if(NR==1)print $2 ".db";;}' $fn
#     fi	# segdef* file(s) exist
     done < $file
   fi
 ;;
 *)
  printf "%s\n" "ListTerrDBs <terrid> [terr|make] unrecognized terr|make option - abandoned."
  exit 1
 ;;
esac
popd > /dev/null
#endprocbody
# end ListTerrDBs.sh
