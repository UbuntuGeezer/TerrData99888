#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** CloneRegenSpecMultDB.sh out-of-date **;exit 1"
# 2023-11-25.	wmk.	(automated) Version 3.0.6 paths eliminated (HPPavilion).
# CloneRegenSpecMultDB.sh - Clone a RegenSpecDB.sql, but using multiple <spec-db>s.
# 2/9/23.	wmk.
#
# Usage. bash  CloneRegenSpecMultDB.sh  <terrid> [<src-tid>]
#
#	<terrid> = territory id to clone/Terr235/RegenSpecDB.sql into
#	<src-tid> = (optional) source territory for copy;
#				default is 235 (BayIndies)
#
# Entry. /<src-tid>/RegenSpecDB.psq = template of RegenSpecDB.sql for cloning. 
#	          MakeRegenSpecDB = makefile for cloning
# Dependencies.
#	RegenSpecDB.psq has "endwhere" line at point where street list WHERE
#	 clause to be inserted.
#
# Modification History.
# ---------------------
# 11/25/23.	wmk.	(automated) echo,s to printf,s throughout
# 11/25/23.	wmk.	(automated) Version 3.0.6 Make old paths removed.
# 
# Legacy mods.
# 2/8/23.	wmk.	original shell.
# 2/8/23	wmk.	<src-tid> parameter added.

# Notes. other possibilities for <src-tid> 261 (Ridgewood MHP), 317 (Bay Lake MHP). 
# Support now added for "segmented" territory definitions (like BayIndiesMHP terr 251).
#
# The difference between this and CloneRegenSpecDB is that this one re-inserts the
# --endwhere line after the --herewhere line so the next db insert can happen. The db
# inserts each contain a .open statement to indicate which database. There is still
# a bit of editing to do for each database, but at least the SELECT constraints are
# present. This shell looks for <db-name>.segs.csv instead of 'segdefs.csv'.
P1=$1	# <terrid>
P2=$2	# <src-tid>
if [ -z "$P1" ];then
 printf "%s\n" "CloneRegenSpecMultDB <terrid> [src-tid] missing parameter(s) - abandoned."
 exit 1
fi
if [ -z "$P2" ];then
 P2=235
fi
#	Environment vars:
if [ -z "$TODAY" ];then
 . ~/GitHub/TerritoriesCB/Procs-Dev/SetToday.sh
#TODAY=2022-04-22
fi
#procbodyhere
# note: awkterrwhere.txt needs a repeat edit from the database list
# copying the <db-name>.seg.csv over the *TEMP_PATH/TerryyyStreets.txt file
n=0
sed 's?235?$P1?g' ../Terr235/RegenSpecDB.psq > ../Terr$P1/RegenSpecDB$n.sql
lastn=$n
n=1
# now loop repeating the edit and increasing the cycle..
 printf "%s\n" $PWD
 ls ../Terr$P1/*segs.csv > $TEMP_PATH/SegsList.txt
 mawk -F "." '{print $1}' $TEMP_PATH/SegsList.txt > $TEMP_PATH/CloneDBsList.txt
file=$TEMP_PATH/CloneDBsList.txt
#printf "%s\n" " pausing Cloning... DBs list follows:"
#cat $TEMP_PATH/CloneDBsList.txt
#ls -lh ../Terr$P1/RegenSpecDB$lastn.sql
st=Streets
# REPLY is the database name.. <dbname>.segs.csv is the code to copy to 
#  *TEMP_PATH/TerryyyStreets.txt.
while read -e;do
 dbname=$REPLY
 printf "%s\n" " Processing for $dbname..."
 cp ../Terr$P1/$dbname.segs.csv $TEMP_PATH/Terr$P1$st.txt
 mawk -f awkmterrwhere.txt ../Terr$P1/RegenSpecDB$lastn.psq > ../Terr$P1/RegenSpecDB$lastn.ps
 sed "s?235?$P1?g" ../Terr$P1/RegenSpecDB$lastn.ps > ../Terr$P1/RegenSpecDB$n.sql
 lastn=$n
 n=$((n+1))
done; < $file 
cp -pv ../Terr$P1/RegenSpecDB$lastn.sql RegenSpecDB.sql
sed "s?$P2?$P1?g" ../Terr$P2/MakeRegenSpecDB > ../Terr$P1/MakeRegenSpecDB
printf "%s\n" " RegenSpecDB.sql cloned into Terr$P1."
#endprocbody
printf "%s\n" "  CloneRegenSpecMultDB $P1 $P2 complete."
~/sysprocs/LOGMSG "  CloneRegenSpecMultDB $P1 $P2 complete."
# end CloneRegenSpecMultDB.sh
