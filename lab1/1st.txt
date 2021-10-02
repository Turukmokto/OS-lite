#! /bin/bush
touch first
echo "$1" > first
echo "$2" >> first
echo "$3" >> first
sort -n first | tail -1