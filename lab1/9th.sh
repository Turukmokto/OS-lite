#! /bin/bash
grep -R -h -c ^ /var/log/*.log | awk '{s+=$1} END {print s}'