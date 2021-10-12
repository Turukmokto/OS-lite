#! /bin/bash

while true; do
    echo "Your current directory is"; pwd
    read -p "Input .. to up, quit to quit or the name of the directory you want : " str
    if [[ "$str" == "quit" ]]; then
exit 0
    else
        cd $str
    fi
done