#! /bin/bash

ppid=$$
operation="+"
answer=1

(tail -f pipe) |
while true
do
    read Line
    case $Line in
        "QUIT")
        pkill -P $ppid
        exit 0
        ;;
        "+"|"*")
        operation=$Line
        ;;
        *)
        case $operation in
            "+")
            answer=$(($answer + $Line))
            ;;
            "*")
            answer=$(($answer * $Line))
            ;;
        esac
        echo $answer
        ;;
    esac
done