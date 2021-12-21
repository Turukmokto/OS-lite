net start > netservices1.txt
net stop dnscache
timeout /t 15
net start > netservices2.txt
fc netservices1.txt netservices1.txt
net start dnscache
