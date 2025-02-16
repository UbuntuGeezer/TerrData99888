#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** RemakeCloneMHP.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# RemakeCloneMHP.sh - Clone MakeSpecials.sql, MakeMakeSpecials from territory 235..
# 2/12/23.	wmk.
#
# Usage. bash  RemakeCloneMHP.sh  <terrid> [<src-tid>]
#
#	<terrid> = territory id to redo MakeSpecials for
#	<src-tid> = (optional) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /Terr235/MakeSpecials.psq = template of MakeSpecials.sql for cloning. 
#	          MakeMakeSpecials = makefile for cloning
# Dependencies.
#	MakeSpecials.psq has "endwhere" line at point where street list WHERE
#	 clause to be inserted.
#
# Exit.	/Terr<src-id>/RegenSpecDB, SetSpecTerrs, SyncTerrToSpec and MakeSpecials
#	 cloned into <terrid> and executed to re-make /<terrid>/Spec_RU.db and
#	 Terr_RU.db databases.

# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/8/23.	wmk.	original shell.
# 2/12/23.	wmk.	parameter error handliing immproved.
#
# Notes. other possibilities for <src-tid> 261 (Ridgewood MHP), 317 (Bay Lake MHP). 
# Currently this shell uses the MakeListTerrStreets *make* process to obtain the
# SQL to be inserted into RegenSpecDB.psq and SetSpecTerrs.psq. This SQL contains
# the appropriate "WHERE" clause(s) for selecting the correct records from the
# "special" database for the MHP.
#
# Future. The resultant file *TEMP_PATH/TerryyyStreets.txt has the "WHERE"
# clause(s) extracted from TerrIDData.db.SegDefs table entry(ies) for the
# database. The *awk directives file awksegdefs.txt will appropriately format
# records extracted from the TerrIDData table entries. These records can
# then be inserted at the *inserthere line in the target RegenSpecDB.psq
# and SetSpecTerrs.psq files.
# set parameters P1..Pn here..
#
P1=$1		# <terrid>
P2=$2		# <src-tid>
if [ -z "$P1" ];then
 printf "%s\n" "RemakeCloneMHP <terrid> [<src-tid>] missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 read -p " <src-tid> not specified - OK to use 235 (y/n): "
 yn=${REPLY^^}
 if [ "$yn" == "Y" ];then
  P2=235
 else
  printf "%s\n" "  rerun RemakeCloneMHP <terri> <src-id> specifying <src-id> - abandoned."
  exit 1
 fi
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
# the first territory in a MHP sequence cannot be cloned from
# any territory except Terr235; After cloning, a warning should
# be given to edit the db29 ATTACH in all of the .sqls to match
# the first territory ID in the sequence.
# first generate Terr<terrid>List.txt.
listsufx=Streets.txt
# run DoSedListTerrStreets.sh here for both segmented and standard.
./DoSedListTerrStreets.sh $P1
make -f MakeListTerrSegs
 # at this point, segdefs.csv will exist if territory is segmented.
 wc -l $TEMP_PATH/Terr$P1$listsufx | mawk '{if ($1 == 0)print;}' > KillIt
 if [ -s KillIt ];then \
  printf "%s\n" " RemakeCloneMHP No streets for terr $P1 - aborting";exit 1;fi
 make -f MakeListTerrStreets
fi
printf "%s\n" "ready for Clone calls... P1='$P1', P2='$P2'"
#exit 0
./CloneSPECIAL.sh        $P1 $P2
./CloneRegenSpecDB.sh    $P1 $P2
./CloneSetSpecTerrs.sh   $P1 $P2
./CloneSetMHPSpecTerrs.sh    $P1 $P2
./CloneSyncTerrToSpec.sh $P1 $P2
./CloneMakeSpecials.sh   $P1 MHP $P2
pushd ./ > $TEMP_PATH/scratchfile
cd $pathbase/$rupath/Terr$P1
if test -f RegenSpecDB.sh;then rm RegenSpecDB.sh;fi
if test -f SetSpecTerrs.sh;then rm SetSpecTerrs.sh;fi
if test -f SyncTerrToSpec.sh;then rm SyncTerrToSpec.sh;fi
touch $codebase/Projects-Geany/SpecialRUdb/ForceBuild
make -f MakeSpecials
popd > $TEMP_PATH/scratchfile
if [ "$P1" == "217" ] ||[ "$P1" == "321" ];then
 printf "%s\n" " ** Be sure to edit RegenSpceCB.sql, SetSpecTerrs.sql, and SyncTerrToSpec.sq1"
 printf "%s\n" "     changing 'BayIndiesMHP.db' to the correct MHP database **"
 read -p "press Enter to continue:"
fi  
#endprocbody
printf "%s\n" "  RemakeCloneMHP $P1 $P2 complete."
~/sysprocs/LOGMSG "  RemakeCloneMHP $P1 $P2 complete."
# end RemakeCloneMHP.sh
