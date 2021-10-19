#! /bin/bash

ps axo pid,command > tmp.txt
cat tmp.txt | grep "/sbin/" | awk '{printf("%s\n", $1)}'
rm tmp.txt

exit 0