# Bash script to install Elasticsearch, Kibana and Filebeat.
This script will install Elasticsearch, Kibana and Filebeat.

The beats will be able to forward nmap results, airodump-ng (beacons & probes), and kismet GPS data.

**_FIRST: Create a local copy of the script._**

```wget https://raw.githubusercontent.com/BwithE/shELK/main/ello-stack.sh```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./rello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

**_Next, we can go to ```127.0.0.1:5601``` to see Kibana._**

**_Select ```Explore on my own```_**
![Screenshot 2023-11-09 at 9 59 28 PM](https://github.com/BwithE/shELK/assets/144924113/2c231154-bdb9-4af3-8e3e-811fd40cee1d)

**_To create "Filebeat.yml" for data injestion, we need to select the menu on the left and find machine learning._**
<img width="1680" alt="machinelearning" src="https://github.com/BwithE/shELK/assets/144924113/0edb54d9-f621-48bf-bb2c-8c91cd7f08d1">
