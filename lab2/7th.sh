#! /bin/bash

for (( i=1; i <= 2; i++ ))
    do
    echo "Request info step $i"

    for pid in $(ps -A -o pid | tail -n +2)
	do
            cmdline_file="/proc/"$pid"/cmdline"
	    io_file="/proc/"$pid"/io"

	    if [ -e $cmdline_file ]
		then
		    cmdline=$(tr -d '\0' <$cmdline_file)
	    fi

	    read_bytes=$(sudo grep -E -s -h "read_bytes" $io_file | grep -E -s -o "[0-9]+")

	    if [[ -z $read_bytes ]]
	        then
		    read_bytes=0
	    fi
	    echo "$pid;$read_bytes;$cmdline"
    done | sort -V --key=1 > $i.txt
    
    if (($i == 1))
	then
	    sleep 60
    fi
done

join -a 2 -t ";" -o 1.1 1.2 2.2 1.3 1.txt 2.txt >out1.txt

cat out1.txt| awk -F";" '{ x=$3-$2; print $1,$2,$3,x,$4}' >out2.txt

cat out2.txt| sort -n -k 4 > out3.txt

cat out3.txt| tail -n 3




exit 0