#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** UnmatchedAddrs.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# UnmatchedAddrs.sh - Run UnmatchedAddrs.sql to get list of Unmatched addresses.
#
# Usage. bash  UnmatchedAddrs.sh [<db-name>]
#
#	<db-name> optional = /Special database name; if specified is included in
#			complete message.
#
# Entry. user must be in /Special folder as *PWD.
P1=$1
sqlite3 < UnmatchedAddrs.sql
printf "%s\n" "UnmatchedAddrs complete."
if [ ! -z "$P1" ];then
 printf "%s\n" "  results on file Un$P1.txt."
fi
# end UnmatchedAddrs.sh
