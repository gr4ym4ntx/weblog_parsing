@echo off
REM Parse through iss weblogs for external ips connecting to the webserver & dump to a file
REM *log is a placeholder for iss logs within a directory. Rename appropriately.
for /f %%x in ('dir /b *log') do (for /f "eol=# tokens=9 delims= " %%i in (%%x) do echo %%i >> all_ips.txt)

REM Sort newly created all_ips.txt file numerically and uniquely, create new file, then remove the allips.txt file, present results 
sort -nu all_ips.txt >> sorted_unique_ips.txt
rm all_ips.txt
type sorted_unique_ips.txt
