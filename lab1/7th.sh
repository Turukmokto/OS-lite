#! bin/bash
email="[0-9A-Za-z_.]+@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+"
grep -E -r -h -s -o -w -a $email /etc | sort | uniq | awk '{printf("%s, ", $1)}' | sed -E "s/,\s*$//" > emails.lst