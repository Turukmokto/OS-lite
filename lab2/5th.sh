#! /bin/bash

ppid=0
ArtSum=0
count=0

function calcARTAvg() {
    AvArtSum=$(echo "$ArtSum/$count" | bc -l -q)
    echo "Average_Running_Children_of_ParentID="${ppid}" is "${AvArtSum}
}

while read line
do
    if [[ -n ${line} ]]
    then
        currPpid=$(echo ${line} | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -E -o "[0-9]+")
        currArt=$(echo ${line} | grep -E -h -s -i -o "Average_Running_Time=[+-]?([0-9]*[.])?[0-9]+" | grep -E -o "[+-]?([0-9]*[.])?[0-9]+" | awk '{printf("%s",$1)}')

        if [[ ${ppid} == ${currPpid} ]]
        then
            ArtSum=$(echo "$ArtSum+$currArt" | bc -l -q)
            count=$(echo "$count+1" | bc -l -q)
        else
	    calcARTAvg

            ArtSum=${currArt}
            ppid=${currPpid}
            count=1
        fi
        
        echo $line
    fi
done < res4.txt

calcARTAvg

exit 0