#!/bin/bash

clear

# installs elasticsearch
echo "Installing and starting Elasticsearch."
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.9-amd64.deb
sudo dpkg -i elasticsearch-7.17.9-amd64.deb
sudo rm -f elasticsearch-*.deb
sudo systemctl daemon-reload
sudo systemctl start elasticsearch

# installs kibana
clear
echo "Installing and starting Kibana."
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.17.9-amd64.deb
sudo dpkg -i kibana-7.17.9-amd64.deb
sudo rm -f kibana-*.deb
sudo systemctl start kibana

# installs filebeat
clear
echo "Installing Filebeat"
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.9-amd64.deb
sudo dpkg -i filebeat-7.17.9-amd64.deb
sudo rm -f filebeat-7.17.9-amd64.deb

# checking if elasticsearch is running on default settings
clear
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
    #### filebeat service location ####
    # /lib/systemd/system/filebeat.service

    # Creates the following directories for the beats we will create
    sudo mkdir /var/lib/filebeat/aps
    sudo mkdir /var/log/filebeat/aps
    sudo mkdir /var/lib/filebeat/nmap
    sudo mkdir /var/log/filebeat/nmap
    sudo mkdir /var/lib/filebeat/clients
    sudo mkdir /var/log/filebeat/clients
    sudo mkdir /var/lib/filebeat/arpscan
    sudo mkdir /var/log/filebeat/arpscan

    # move the service beats into the required locations
    sudo cp Services/*.service /lib/systemd/system/
    sudo systemctl daemon-reload

    # Creating pipelines for specific data sets
    clear
    echo "Creating Pipelines." 
    bash Pipelines/aps-pipeline.sh
    bash Pipelines/clients-pipeline.sh
    bash Pipelines/nmap-pipeline.sh
    #bash Pipelines/arp-pipeline.sh

    # Moving filebeat conf files
    clear
    echo "Moving Filebeats.conf files"
    sudo cp Filebeat/*.yml /etc/filebeat/

    # Creates the directories where data forwarded to ELK will be saved
    mkdir /home/kali/elk/
    mkdir /home/kali/elk/nmap
    mkdir /home/kali/elk/arp
    mkdir /home/kali/elk/aps
    mkdir /home/kali/elk/clients
    sudo chown kali:kali /home/kali/elk
    sudo chown kali:kali /home/kali/elk/*

    # Starts the beat services
    sudo systemctl start nmapbeat.service
    sudo systemctl start apbeat.service
    sudo systemctl start clientbeat.service
    #sudo systemctl start arpbeat.service
    

    # Enables the listed services
    sudo systemctl enable elasticsearch
    sudo systemctl enable kibana
    sudo systemctl enable nmapbeat.service
    sudo systemctl enable apbeat.service
    sudo systemctl enable clientbeat.service
    #sudo systemctl enable arpbeat.service

    wget https://raw.githubusercontent.com/BwithE/Nmap-XML-to-CSV/master/xml2csv.py 
    mv xml2csv.py /home/kali/shelk/Scripts/

# export kibana index-patterns
#curl -X POST "127.0.0.1:5601/api/saved_objects/_export" -H "kbn-xsrf: true" -H "Content-Type: application/json" --data '{"objects":[{"type":"index-pattern","id":"local-nmap"}]}' --output local-nmap.ndjson
# import kibana index-patterns
# can't be imorted until there is data, so the nmap report has to be built first
#curl -X POST "127.0.0.1:5601/api/saved_objects/_import" -H "kbn-xsrf: true" -H "Content-Type: multipart/form-data" -F file=@Index-Patterns/nmap.ndjson

    
else
    echo "Filebeat is not installed."
fi

clear
echo ""
echo "Please open your browser and go to 127.0.0.1:5601"
echo ""
