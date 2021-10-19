#! /bin/bash

for pid in $(ps -A -o pid | tail -n +2)
do
    status="/proc/"$pid"/status"
    sched="/proc/"$pid"/sched"
    
    ppid=$(sudo grep -E -s -h "PPid" $status | grep -E -s -o "[0-9]+")
    sum_exec_runtime=$( grep -E -s -h "se.sum_exec_runtime" $sched | grep -E -s -o "[0-9]+.[0-9]+")
    nr_switches=$( grep -E -s -h "nr_switches" $sched | grep -E -s -o "[0-9]+.[0-9]+")
    
    if [[ -z $sum_exec_runtime ]]
    then 
	sum_exec_runtime=0
    fi

    if [[ -z $nr_switches ]]
    then 
	nr_switches=0
	art=$sum_exec_runtime
    else
        art=$(bc<<<"scale=3;$sum_exec_runtime/$nr_switches")
    fi

    if [[ -n $ppid ]]
    then 
	echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art"
    fi
done | sort -V --key=2 > res4.txt

exit 0