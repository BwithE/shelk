#!/bin/bash
# this script can take an airodump-ng.csv report and split the beacons(ap) from the probes(clients)

input=ApCap-01.csv
aps=aps.csv
clients=clients.csv

sed -i 's/, /,/g' $input
awk '/^Station MAC,First time seen,Last time seen,Power,# packets,BSSID,Probed ESSIDs/{exit}1' $input > $aps
awk '/^Station MAC,First time seen,Last time seen,Power,# packets,BSSID,Probed ESSIDs/,0' $input > $clients
sed -i 's/Probed ESSIDs/ESSID/g' $clients
sed -i 's/Station MAC/Client MAC/g' $clients

grep -v -E '^\s*$' $aps | cut -d "," -f1,4,6,7,8,14 > /home/kali/elk/aps/aps.csv
grep -v -E '^\s*$' $clients | cut -d "," -f1,6,7 > /home/kali/elk/clients/clients.csv

#cat $aps | cut -d "," -f1,4,6,7,8,14 > /home/kali/elk/aps/aps.csv
#cat $clients | cut -d "," -f1,6,7 > /home/kali/elk/clients/clients.csv

rm -f $aps 
rm -f $clients

#mv $aps /home/kali/elk/aps
#mv $clients /home/kali/elk/clients

rm -f $input
