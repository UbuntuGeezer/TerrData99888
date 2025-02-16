#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# ListTerrDBs.sh - list SC Special .dbs for any given territory.
#	11/20/24.	wmk.
#
# Usage. bash  ListTerrDBs.sh <terrid>
#
#	<terrid> = territory ID
#
# Entry. /Special/Make.<spec-db>.Terr files contain *make lists of
#	territories using <spec-db>
#
# Exit. list of /Special .dbs for territory <terrid> to screen
#
# Modification History.
# ---------------------
# 11/20/24.	wmk.	original; adapted for SC/Special from RU/Special.
# Legacy mods.
# 11/15/24.	wmk.	(automated) echo,s to printf,s throughout.
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
# P1=<terrid>
#
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "ListTerrDBs <terrid> missing parameter(s) - abandoned."
 exit 1
fi
#procbodyhere
P1=$1
P2=${2,,}
if [ -z "$P1" ];then
 printf "%s\n" "ListTerrDBs <terrid> missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 P2=make
fi
#procbodyhere
pushd ./ > /dev/null
cd $pathbase/$scpath/Special
grep -rle "MAKE).*Terr$P1/MakeSpecials" --include "Make.*.Terr"
popd > /dev/null
#endprocbody
# end ListTerrDBs.sh
