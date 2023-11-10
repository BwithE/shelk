# Bash script to install Elasticsearch, Kibana and Filebeat.
This script will install Elasticsearch, Kibana and Filebeat.

The beats will be able to forward nmap results, airodump-ng (beacons & probes), and kismet GPS data.

**_FIRST: Create a local copy of the script._**

```wget https://raw.githubusercontent.com/BwithE/shELK/main/ello-stack.sh```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./rello-stack.sh``` 

**_or_**

```sudo bash ello-stack.sh```

**_Next, we can go to ```127.0.0.1:5601``` to see Kibana_**
