#! bin/bash
touch emails.lst
grep -E -r -o -h '[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]+' '/etc/' | awk '{printf("%s, ", $1)}' > emails.lst