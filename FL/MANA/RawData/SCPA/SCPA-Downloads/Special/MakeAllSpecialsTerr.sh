#/bin/bash
echo " ** <filespec> out-of-date **";exit 1
echo " ** <filespec> out-of-date **";exit 1
# 2023-09-21   wmk.   (automated) ver2.0 path fixes.
# Make.AllSpecials.Terr - makefile to re-make all special territories.
#	11/24/22.	wmk.
cd $pathbase/$scpath/Special
ls Make*.Terr > MakeList.txt
sed -i -f sedadddollar.txt MakeList.txt
cat MakeList.txt
#read -p "Enter ctrl-c to remain in Terminal:"
#exit 0
#loop reading makelist files and process with *make*
file=MakeList.txt
while read -e;do
 len=${#REPLY}
 make_file=${REPLY:0:$len}
 first_char=${make_file:0:1}
 if [ "$first_char" == "#" ];then
  echo "$makefile > /dev/null.txt"
 elif [ "$first_char" == "\$" ];then
  break
 else
  echo " processing $make_file.." 
  make -f $make_file
 fi
done < $file
# end Make.AllSpecials.Terr
