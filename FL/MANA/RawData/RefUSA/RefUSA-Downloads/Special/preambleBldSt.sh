# preambleBldSt.sh - preamble for BuildStreetDB shell.
echo " ** <filespec> out-of-date **";exit 1
#	9/9/22.	wmk.
if [ -z "$rupath" ] || [ -z "$scpath" ];then
 echo "  *rupath and/or *scpath environment vars not set - shell exiting."
 exit 1
fi
echo "  Adding streets for territory 642 ..."
# end preambleBldSt.sh
