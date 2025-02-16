#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# assume on path $rupath/Special
P1=$1
./DoSedDBTerrList.sh $P1
make --silent -f MakeListCountTerrsbyDB
./ListCountTerrsbyDB.sh
# end LoopCountTerrsByDB
