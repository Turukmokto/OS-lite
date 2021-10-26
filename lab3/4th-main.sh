#! /bin/bash

./t4-proc.sh &
pid1=$!
./t4-proc.sh &
pid2=$!
./t4-proc.sh &
pid3=$!

cpulimit --pid=$pid1 --limit=10 &

sleep 15 && kill $pid3 &
