# TidyPreamble.psh/sh - Preamble for <special-db>Tidy.sh.
echo " ** <filespec> out-of-date **";exit 1
#	5/27/24.	wmk.	eliminate *TODAY check; done beforehand.
#	5/4/24.		wmk.	always remove SQLTemp.sql before new one started.
#	9/10/22.	wmk.
#	12/11/22.	wmk.	use SetToday.sh to set TODAY.
if test -f SQLTemp.sql;then rm SQLTemp.sql;fi 
