#!/bin/bash

TrashPath="$HOME/.trash"
File="$PWD/$1"
TrashLog="$HOME/.trash.log"

Timestamp=$(date +%s)
 
if ! [ -f "$File" ];
then
    echo "$File: No such file"
    exit 0
fi
 
if ! [ -d "$TrashPath" ];
then
    mkdir "$TrashPath"
fi

echo "$File : $TrashPath/$Timestamp-Deleted" >> "$TrashLog"
ln "$File" "$TrashPath/$Timestamp-Deleted"
rm "$File"