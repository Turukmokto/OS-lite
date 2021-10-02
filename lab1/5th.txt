#! bin/bash
touch info.log
awk '$2=="<info>"' /var/log/anaconda/syslog > info.log