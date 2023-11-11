# Using ELK for Network RECON.
I created bash scripts to install Elasticsearch, Kibana and Filebeat on a Debian based OS (PREFERABLY KALI).
Along with the above, I modify the "Filebeat.service" to split into different services based off of data types.

After ELK is installed, I injest an nmap scan into elastic.

Once installed, by default, they will be listening on localhost and their associated ports.

Elasticsearch ```127.0.0.1:9200``` && Kibana ```127.0.0.1:5601```

**_FIRST: Create a local copy of the script._**

```git clone https://github.com/bwithe/shELK```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```
