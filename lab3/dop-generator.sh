#! /bin/bash

echo "Enter a signal to handler: 'TERM' 'QUIT' 'KILL' or 'QUIT' to exit"
Command=""
while [[ $Command != "QUIT" ]]
do
    read Command
    echo "Signal = $Command"
    case $Command in
        "QUIT")
        kill -USR1 $(cat .pid)
        ;;
        "KILL")
        kill -USR2 $(cat .pid)
        ;;
        "TERM")
        kill -SIGTSTP $(cat .pid)
        ;;
        "QUIT")
        kill $(cat .pid)
        ;;
        *) 
        continue
        ;;
    esac
done