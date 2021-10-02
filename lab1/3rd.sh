#! bin/bash
echo "1.nano"
echo "2.vi"
echo "3.links"
echo "4.exit"
read str
if [[ str -eq "1" ]]
then
nano
elif [[ str -eq "2" ]]
then
vim
elif [[ str -eq "3" ]]
then
links
elif [[ str -eq "4" ]]
then
exit 0
fi