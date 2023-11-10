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
else
    echo "Filebeat is not installed."
fi

#### filebeat service location
# /lib/systemd/system/filebeat.service
# modify this file per each service you want to run

