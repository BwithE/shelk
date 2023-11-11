#!/bin/bash
clear

echo "Installing and starting Elasticsearch."
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.9-amd64.deb
sudo dpkg -i elasticsearch-7.17.9-amd64.deb
sudo rm -f elasticsearch-*.deb
sudo systemctl daemon-reload
sudo systemctl start elasticsearch

clear
echo "Installing and starting Kibana."
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.17.9-amd64.deb
sudo dpkg -i kibana-7.17.9-amd64.deb
sudo rm -f kibana-*.deb
sudo systemctl start kibana

clear
echo "Installing Filebeat"
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.9-amd64.deb
sudo dpkg -i filebeat-7.17.9-amd64.deb
sudo rm -f filebeat-7.17.9-amd64.deb


clear
# checking if elasticsearch is running on default settings
elasticcurl="127.0.0.1:9200"
if curl -s "$elasticcurl" | grep -q -i "You know"; then
    echo "Elasticsearch is running on 127.0.0.1:9200"
else
    echo "Elasticsearch errored out somewhere"
fi
# checking if kibana is running on default settings
kibanacurl="127.0.0.1:5601"
response=$(curl -s "$kibanacurl")
if [ -z "$response" ]; then
    echo "Kibana is running on 127.0.0.1:5601"
elif curl -s "$kibanacurl" | grep -q "Kibana server is not ready yet"; then
    echo "Kibana server is not ready yet "
else
    echo "Kibana errored out somewhere"
fi

# checks to see if filebeat was installed
if [ -e /etc/filebeat/filebeat.yml  ]; then
    echo "Filebeat is installed, but not running"
    #### filebeat service location
    # /lib/systemd/system/filebeat.service

    # Creates the following directories for the beats we will create
    sudo mkdir /var/lib/filebeat/arpscan
    sudo mkdir /var/log/filebeat/arpscan
    sudo mkdir /var/lib/filebeat/accesspoints
    sudo mkdir /var/log/filebeat/accesspoints
    sudo mkdir /var/lib/filebeat/nmap
    sudo mkdir /var/log/filebeat/nmap
    sudo mkdir /var/lib/filebeat/clients
    sudo mkdir /var/log/filebeat/clients

    # move the service beats into the required locations
    sudo cp Services/*.service /lib/systemd/system/
    sudo systemctl daemon-reload

    # Creating pipelines for specific data sets
    clear
    echo "Creating Pipelines." 
    bash Pipelines/*pipeline.sh

    # Moving filebeat conf files
    clear
    echo "Moving Filebeats.conf files"
    sudo cp Filebeat/*.yml /etc/filebeat/

    # Creates the directories where data forwarded to ELK will be saved
    mkdir /home/kali/elk/
    mkdir /home/kali/elk/nmap
    mkdir /home/kali/elk/arp
    mkdir /home/kali/elk/ap
    mkdir /home/kali/elk/client
    #sudo chown kali:kali

    # Starts the beat services
    sudo systemctl start nmapbeat.service
    #sudo systemctl start apbeat.service
    #sudo systemctl start arpbeat.service
    #sudo systemctl start clientbeat.service

    # Enables the listed services
    sudo systemctl enable elasticsearch
    sudo systemctl enable kibana
    sudo systemctl enable nmapbeat.service
    #sudo systemctl enable apbeat.service
    #sudo systemctl enable clientbeat.service
    #sudo systemctl enable arpbeat.service

else
    echo "Filebeat is not installed."
fi

clear
echo "Please open your browser and go to 127.0.0.1:5601"
