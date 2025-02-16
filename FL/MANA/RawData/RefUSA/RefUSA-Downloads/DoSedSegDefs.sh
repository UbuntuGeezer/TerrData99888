#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedSegDefs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedSegDefs.sh - edit all SegDefs relevant files for Load, Add, Clear SegDefs.
#	2/15/23.
#
# Usage. bash  DoSedLoadSegDefs.sh <terrid> <spec-db>
#
#	<terrid> = territory ID for segments
#	<spec-db> - <spec-db> name for Add operations
#
# Entry. RU-Downloads/Special/MakeLoadSegDefs.tmp = makefile template
#					 /Special/LoadSegDefs.psq = SQL template
#
# Exit.	 MakeLoadSegDefs.tmp -> MakeLoadSegDefs
#		 MakeAddSegDefs.tmp > MakeAddSegDefs
#		 MakeClearSegsDefs.tmp > MakeClearSegDefs
#		 LoadSegDefs.psq   -> LoadSegDefs.sql
#		 AddSegDefs.psq  -> AddSegDefs.sql
#		 ClearSegDefs.psq   -> ClearSegDefs.sql
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/11/23.	wmk.	original code.
# 2/12/23.	wmk.	<spec-db> parameter added; AddSegDefs.psq added to edits.
# 2/15/23.	wmk.	name change from DoSedLoadSegDefs to DoSedSegDefs;
#			 ClearSegDefs files added to edit list.
#
# Notes. DoSedSegDefs preps the files for
#	 *make* -f Make[LoadSeg|Add|Clear]SegDefs.
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "DoSedSegDefs <terrid> <spec-db> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?yyy?$P1?g" LoadSegDefs.psq > LoadSegDefs.sql
sed "s?yyy?$P1?g;s?<spec-db>?$P2?g" AddSegDefs.psq > AddSegDefs.sql
sed "s?yyy?$P1?g" ClearSegDefs.psq > ClearSegDefs.sql
sed "s?yyy?$P1?g" preambleClear.s > preambleClear.sh
sed "s?yyy?$P1?g" Jumpto.psq > Jumpto.sql
#
sed "s?yyy?$P1?g" MakeLoadSegDefs.tmp > MakeLoadSegDefs
sed "s?yyy?$P1?g" MakeAddSegDefs.tmp > MakeAddSegDefs
sed "s?yyy?$P1?g" MakeClearSegDefs.tmp > MakeClearSegDefs
printf "%s\n" "DoSedSegDefs  $P1 complete."
