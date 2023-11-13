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

bash /home/kali/shelk/scripts/ap-client-report.sh
#rm  -f "ApCap-01.csv"
