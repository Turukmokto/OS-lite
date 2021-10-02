#! bin/bash
man bash | grep -E -o '[A-Za-z]+' |
awk '{if (length($1) >= 4) print $1}' | sort | uniq -c | sort -n -k1 | tail -3