#!/bin/bash

TrashLog="$HOME/.trash.log"
TrashPath="$HOME/.trash"

declare -a ArrayOfResultFirst
declare -a ArrayOfResultSecond

if ! [ -d "$TrashPath" ];
then
    echo "No such directory: $TrashPath"
    exit 0
fi

if ! [ -f "$TrashLog" ];
then
    echo "No such file: $TrashLog"
    exit 0
fi

echo -e "\n\nAll results:\n"
index=1
while read Line
do
    TMP=$(echo $Line | awk -F ":" '{print $1}' | awk -F "/" '{print $NF}')
    TMP=$(echo "$TMP" | rev | cut -c 2- | rev)
    

    if [[ -n $Line && "$TMP" = "$1" ]]
    then

        ArrayOfResultFirst[index]=$(echo $Line | awk -F ":" '{print $1}')
        
        ArrayOfResultSecond[index]=$(echo $Line | awk -F ":" '{print $2}')
        echo "$index) ${ArrayOfResultFirst[index]}"
        
        ArrayOfResultFirst[index]=$(dirname $(echo "${ArrayOfResultFirst[index]}"))
        index=$(($index + 1))
    fi
done < $TrashLog

index=$(($index - 1))
echo -e "\nSelect the result you need"
read Number

if [[ "$Number" -lt 1 || "$Number" -gt "$index" ]]
then
    echo "Invalid number"
    exit 0
fi

if ! [ -d "${ArrayOfResultFirst[Number]}" ];
then
    echo -e "\nOriginal directory is not reachable. File will be recover in home directory \n"
    ArrayOfResultFirst[Number]="$HOME"
fi

NewName=$1
while [ -f "${ArrayOfResultFirst[Number]}/$NewName" ]
    do
        echo -e "\nFile with the same name is located in the directory. You need to change the file name\n"
	read NewName
        
    done

ArrayOfResultFirst[Number]="${ArrayOfResultFirst[Number]}/$NewName"
echo ${ArrayOfResultSecond[Number]}
echo ${ArrayOfResultFirst[Number]}
ln ${ArrayOfResultSecond[Number]} "${ArrayOfResultFirst[Number]}"
rm ${ArrayOfResultSecond[Number]}
echo "Success!"