#! /bin/bash

mkdir "test" && {
echo "catalog test was created successfully" > report;
touch  ./"test"/$(date +"%F_%R")
}

ping -c 1 "www.net_nikogo.ru" 2>error.txt || {
echo "$(date +"%F_%R")"  >> report;
cat error.txt >>report
rm error.txt
}