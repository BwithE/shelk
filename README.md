# Using ELK for Network RECON.
We will be able to injgest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

There are multiple bash scripts that will install Elasticsearch, Kibana and Filebeat on a Debian based OS (PREFERABLY KALI).

Modify the "Filebeat.service" to split into different services based off of data types.

After ELK is installed, the script creates the proper files and directories for conf files, logging files, and services files.
After that, we will injest an nmap scan into elastic to create dashboards in Kibana.

**_FIRST: Create a local copy of the script._**

```git clone https://github.com/bwithe/shELK```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

# I WILL UPLOAD SNAPSHOTS SHORTLY #
