#! /bin/bash

ps a h -u bes -o pid,command | awk '{printf("%s:%s\n", $1, $2)}' >tmp.txt
cat tmp.txt
wc -l tmp.txt | awk '{printf("%s\n", $1)}'>out.txt
rm tmp.txt

exit 0