#!/bin/bash

# It creates a AiroDump background job
# After the capture is done, it converts the cap into a CSV
# The CSV is then injested into ELASTICSEARCH
clear

# This section resets all monitor cards back into managed mode
clear
echo "Resetting network cards."
#start-sleep -Seconds 5
sudo airmon-ng check kill
sudo systemctl start NetworkManager
sudo airmon-ng stop wlan0mon

# This command starts the monitor mode
clear
sudo airmon-ng start wlan0

# This section start the Airodump collection
sudo airodump-ng -w ApCap wlan0mon --output-format csv &

# This allows airodump to run for the time alloted below
clear
echo "Collecting Wireless data for 60 seconds. "
sleep 60
# This kills airodump
sudo killall airodump-ng

# This section resets all monitor cards back into managed mode
clear
echo "Resetting network cards."
sudo airmon-ng check kill
sudo systemctl start NetworkManager
sudo airmon-ng stop wlan0mon

##############
# Clears the terminal
clear

#bash /home/kali/shelk/scripts/ap-client-report.sh
#rm  -f "ApCap-01.csv"

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