#!/bin/bash
echo " ** <filespec> out-of-date **";exit 1
# assume on path $rupath/Special
$b/LoopAnyShell.sh "./DoSedDBTerrList.sh;make --silent -f MakeListCountTerrsbyDB" $t/DBList.txt
# end testloop
