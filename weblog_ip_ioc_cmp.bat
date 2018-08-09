@echo off
REM Compare a list of two IP sets, in this case weblogs and ioc sets in two separate text files
REM Matches will be dumped to ioc_ip_match.txt file and displayed
REM "sorted_unique_ips.txt" is a placeholder for your file listing external IP connections, rename appropriately
REM "all_ioc.txt" is a placeholder for your file listing all ioc IPs you are tracking, rename appropriately
for /f %%i in (sorted_unique_ips.txt) do (for /f %%a in (all_ioc.txt) do (if %%i==%%a echo %%a >> ioc_ip_match.txt))
type ioc_ip_match.txt
