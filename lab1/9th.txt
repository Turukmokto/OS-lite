#! bin/bash
sudo find /var/log -name "*.log" | xargs wc -l