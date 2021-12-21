mkdir c:\lab6
cd c:\lab6
ver > ver.txt
wmic os get Caption > wmicCaption.txt 
wmic os get FreePhysicalMemory,TotalVisibleMemorySize > wmicMemory.txt 
wmic LOGICALDISK GET DeviceId, VolumeName, Description, Size > wmicDisk.txt

mkdir TEST
copy .\ .\TEST
cd c:\lab6\TEST

type * >typeall
del *.txt