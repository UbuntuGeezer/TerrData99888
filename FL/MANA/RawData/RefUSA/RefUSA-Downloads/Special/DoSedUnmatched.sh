#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** DoSedUnmatched.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# DoSedUnmatched.sh - Run *sed on UnmatchedAddrs.psq -> .sql.
#	12/29/22.	wmk.
#
# Usage. bash  DoSed.sh <spec-db> [-c]
#
#	<spec-db> = special database root name (e.g. Airport Ave)
#	-c = (optional) count only, no detail
#
# Exit. /Special/UnmatchedAddrs.psq -> UnmatchedAddrs.sql
#
P1=$1
if [ -z "$P1" ];then
 printf "%s\n" "DoSedUnmatched <spec-db> missing parameter(s) - abandoned."
 exit 1
fi
sed "s?<spec-db>?$P1?g" $pathbase/$rupath/Special/UnmatchedAddrs.psq > UnmatchedAddrs.sql
# end DoSedUnmached.sh
