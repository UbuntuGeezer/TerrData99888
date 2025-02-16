#!/bin/bash
# SCDwnldDate?.sh - Get date(s) of SC downloads.
#	4/25/24.	wmk.
#
# Usage. bash  SCDwnldDate?.sh
#
# Entry. 
#
# Dependencies.
#
# Modification History.
# ---------------------
# 4/25/24.	wmk.	(automated) echo,s to printf,s throughout.
# 4/25/24.	wmk.	(automated) build level 4.0.6.
# 4/25/24.	wmk.	(automated) mods for build level 4.0.6.
# 4/25/24.	wmk.	-v added to SetToday.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 11/25/23.	wmk.	(automated) printf "%s\n",s to pri# 8/26/23.	wmk.	original shell.
#
# Notes. 
#
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/sysprocs/SetToday.sh -v
fi
#procbodyhere
pushd ./ > /dev/null
cd $pathbase/$scpath
ls -lh SCPA_*.db
popd > /dev/null
#endprocbody
printf "%s\n" "  SCDwnldDate? complete."
~/sysprocs/LOGMSG "  SCDwnldDate? complete."
# end SCDwnldDate?.sh
