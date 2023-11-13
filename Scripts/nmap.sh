#!/bin/bash
# This script runs an nmap scan, converts all the data so that elasticsearch can injest
# It will check versions on all open ports

read -p "What IP/IP's would you like to scan? (ex: 127.0.0.1 or 192.168.1.1/24): " ip

#nmap scan
nmap $ip -sV -Pn -n -p- --open -oX scan

# runs python script that converts nmap.xml into a csv
python3 xml2csv.py -f scan -csv scans.csv
rm -f scan

# takes the nmap.csv and cuts down the fields and dumps it into a folder where elastic will look for data
cat scans.csv | cut -d "," -f1,2,3,4,5,6,7 > /home/kali/elk/nmap/nmap.csv
rm -f scans.csv
