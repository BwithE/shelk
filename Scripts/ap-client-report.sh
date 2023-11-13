#!/bin/bash

input=ApCap-01.csv
aps=aps.csv
clients=clients.csv

sed -i 's/, /,/g' $input
awk '/^Station MAC,First time seen,Last time seen,Power,# packets,BSSID,Probed ESSIDs/{exit}1' $input > $aps
awk '/^Station MAC,First time seen,Last time seen,Power,# packets,BSSID,Probed ESSIDs/,0' $input > $clients
sed -i 's/Probed ESSIDs/ESSID/g' $clients
sed -i 's/Station MAC/Client MAC/g' $clients

mv $aps /home/kali/elk/aps
mv $clients /home/kali/elk/clients

rm -f $input