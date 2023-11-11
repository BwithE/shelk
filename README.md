# Using ELK for Network RECON.
We will be able to injest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a Debian based OS (PREFERABLY KALI). 

It also creates the proper log and lib directories.

Then it copies the modified **_"Filebeat.service"_** which splits into different services based off of data types.

Another script gets called to create the proper pipelines for the data sets.

Then we copy all the **_"filebeat conf files"_** get copied to **_"/etc/filebeat/"_**

FINALLY, we will injest an nmap scan into elastic to create dashboards in Kibana.

**_FIRST: Create a local copy of the script._**

```git clone https://github.com/bwithe/shELK```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

# I WILL UPLOAD SNAPSHOTS SHORTLY #
