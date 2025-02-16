#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedLoadSegDefs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedLoadSegDefs.sh - edit MakeLoadSegDefs.tmp, LoadSegDefs.psq.
#
# Usage. bash  DoSedLoadSegDefs.sh <terrid>
#
# Entry. RU-Downloads/Special/MakeLoadSegDefs.tmp = makefile template
#					 /Special/LoadSegDefs.psq = SQL template
#
# Exit.	 MakeLoadSegDefs.tmp -> MakeLoadSegDefs
#		 MakeAddSegDefs.tmp > MakeAddSegDefs
#		 LoadSegDefs.psq   -> LoadSegDefs.sql
#		 AddSegDefs.psa  -> AddSegDefs.sql
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 2/11/23.	wmk.	original code.
# 2/12/23.	wmk.	<spec-db> parameter added; AddSegDefs.psq added to edits.
# Notes. DoSedListTerr Streets preps the files for *make* -f MakeLoadSegDefs.
#
P1=$1
P2=$2
if [ -z "$P1" ] || [ -z "$P2" ];then
 printf "%s\n" "DoSedLoadSegDefs <terrid> <spec-db> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?yyy?$P1?g" LoadSegDefs.psq > LoadSegDefs.sql
sed "s?yyy?$P1?g;s?<spec-db>?$P2?g" AddSegDefs.psq > AddSegDefs.sql
sed "s?yyy?$P1?g" Jumpto.psq > Jumpto.sql
#
sed "s?yyy?$P1?g" MakeLoadSegDefs.tmp > MakeLoadSegDefs
sed "s?yyy?$P1?g" MakeAddSegDefs.tmp > MakeAddSegDefs
printf "%s\n" "DoSedLoadSegDefs  $P1 complete."
