#! bin/bash
awk -F ":" '{printf("%s %s\n", $1, $3)}' '/etc/passwd' | sort -k2 -n