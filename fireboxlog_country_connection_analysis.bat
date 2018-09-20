@echo off
echo working ...
mkdir hk
mkdir chn 
grep "geo_src=HKG" traffic.csv | grep "Allowed" | cut -d "," -f9,10,11,12,13,14,38 > allowed_hk_src.csv
grep "geo_dst=HKG" traffic.csv | grep "Allowed" | cut -d "," -f9,10,11,12,13,14,38 > allowed_hk_dst.csv
echo still working ...
REM cut -d "," -f10,13,14,36,37 traffic.csv | grep "CHN" | grep "Allowed" > allowed_chn.csv
grep "geo_src=CHN" traffic.csv | grep "Allowed" | cut -d "," -f9,10,11,12,13,14,38 > allowed_chn_src.csv
grep "geo_dst=CHN" traffic.csv | grep "Allowed" | cut -d "," -f9,10,11,12,13,14,38 > allowed_chn_dst.csv

REM Report details of ALLOWED HK connections
echo Building HK sources report ..
echo Number of unique Hong Kong IPs ALLOWED to connect to "SITE Assets": > hk_src_set.txt
cut -d "," -f3 allowed_hk_src.csv | sort -u | wc -l >> hk_src_set.txt
echo. >> hk_src_set.txt
echo ALLOWED Hong Kong connections utilizing the following protocols to access "SITE Assets": >> hk_src_set.txt
cut -d "," -f2 allowed_hk_src.csv | sort -u >> hk_src_set.txt
echo. >> hk_src_set.txt
echo Hong Kong IPs connecting to the following "SITE Assets": >> hk_src_set.txt
cut -d "," -f1,5,6 allowed_hk_src.csv | sort -u >> hk_src_set.txt
echo. >> hk_src_set.txt
echo Set of Hong Kong IPs connecting to the "SITE Assets": >> hk_src_set.txt
cut -d "," -f3 allowed_hk_src.csv | sort -u >> hk_src_ips.txt
type hk_src_ips.txt >> hk_src_set.txt
echo. >> hk_src_set.txt

REM Report details of ALLOWED China destinations
echo Building HK destinations report ..
echo Number of "SITE Assets" connecting to unique Hong Kong IPs: > hk_dst_set.txt
cut -d "," -f5 allowed_hk_dst.csv | sort -u | wc -l >> hk_dst_set.txt
echo. >> hk_dst_set.txt
echo ALLOWED Hong Kong connections utilizing the following protocols: >> hk_dst_set.txt
cut -d "," -f2 allowed_hk_dst.csv | sort -u >> hk_dst_set.txt
echo. >> hk_dst_set.txt
echo These "SITE Assets" are connecting to the Hong Kong IPs: >> hk_dst_set.txt
cut -d "," -f1,3 allowed_hk_dst.csv | sort -u >> hk_dst_set.txt
echo. >> hk_dst_set.txt
echo "SITE Assets" connecting to the following set of Hong Kong IPs: >> hk_dst_set.txt
cut -d "," -f5 allowed_hk_dst.csv | sort -u >> hk_dst_ips.txt
type hk_dst_ips.txt >> hk_dst_set.txt
echo. >> hk_dst_set.txt

type hk_src_ips.txt > hk_total_ip.txt
type hk_dst_ips.txt >> hk_total_ip.txt
sort -u hk_total_ip.txt >> hk_total_unq_ip.txt

REM Report details of ALLOWED China connections
echo Building CHN sources report ..
echo Number of unique China IPs ALLOWED to connect to "SITE Assets": > chn_src_set.txt
cut -d "," -f3 allowed_chn_src.csv | sort -u | wc -l >> chn_src_set.txt
echo. >> chn_src_set.txt
echo ALLOWED China connections utilizing the following protocols to access "SITE Assets": >> chn_src_set.txt
cut -d "," -f2 allowed_chn_src.csv | sort -u >> chn_src_set.txt
echo. >> chn_src_set.txt
echo China IPs connecting to the following "SITE Assets": >> chn_src_set.txt
cut -d "," -f1,5,6 allowed_chn_src.csv | sort -u >> chn_src_set.txt
echo. >> chn_src_set.txt
echo Set of China IPs connecting to the "SITE Assets": >> chn_src_set.txt
cut -d "," -f3 allowed_chn_src.csv | sort -u >> chn_src_ips.txt
type chn_src_ips.txt >> chn_src_set.txt
echo. >> chn_src_set.txt

REM Report details of ALLOWED China destinations
echo Building CHN destinations report ..
echo Number of "SITE Assets" connecting to unique China IPs: > chn_dst_set.txt
cut -d "," -f5 allowed_chn_dst.csv | sort -u | wc -l >> chn_dst_set.txt
echo. >> chn_dst_set.txt
echo ALLOWED China connections utilizing the following protocols: >> chn_dst_set.txt
cut -d "," -f2 allowed_chn_dst.csv | sort -u >> chn_dst_set.txt
echo. >> chn_dst_set.txt
echo These "SITE Assets" are connecting to the China IPs: >> chn_dst_set.txt
cut -d "," -f1,3 allowed_chn_dst.csv | sort -u >> chn_dst_set.txt
echo. >> chn_dst_set.txt
echo "SITE Assets" connecting to the following set of China IPs: >> chn_dst_set.txt
cut -d "," -f5 allowed_chn_dst.csv | sort -u >> chn_dst_ips.txt
type chn_dst_ips.txt >> chn_dst_set.txt
echo. >> chn_dst_set.txt

type chn_src_ips.txt > chn_total_ip.txt
type chn_dst_ips.txt >> chn_total_ip.txt
sort -u chn_total_ip.txt >> chn_total_unq_ip.txt

REM Clean up
echo clean up ...
mv hk_src_set.txt hk\
mv hk_src_ips.txt hk\
mv hk_dst_set.txt hk\
mv hk_dst_ips.txt hk\
mv chn_src_set.txt chn\
mv chn_src_ips.txt chn\
mv chn_dst_set.txt chn\
mv chn_dst_ips.txt chn\

mv allowed_hk_src.csv hk\
mv allowed_hk_dst.csv hk\
mv allowed_chn_src.csv chn\
mv allowed_chn_dst.csv chn\

rm hk_total_ip.txt
rm chn_total_ip.txt
mv hk_total_unq_ip.txt hk\ 
mv chn_total_unq_ip.txt chn\ 