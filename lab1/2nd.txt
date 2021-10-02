#! bin/bash
a=""
read str
if [[ $str == "q" ]]
then
echo ""
else
while [[ $str != "q" ]]
do
a=$a$str
read str
done
fi
echo $a