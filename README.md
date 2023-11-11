# Using ELK for Network RECON.
We will be able to injest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a NEW Debian based OS (PREFERABLY KALI). 

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

**_Once the script is finishing running, you will be asked to open your web-browser and go to ```127.0.0.1:5601```_**

**_Select "Explore on my own"_**

![1explore](https://github.com/BwithE/shELK/assets/144924113/415cc467-138f-4b79-b4f6-c853296ef53d)

**_Select the drop down menu on the top left, and scroll all the way down to the bottom. Select "Stack Management"_**

![2](https://github.com/BwithE/shELK/assets/144924113/e8aadcbd-c934-4527-9830-2914c4aa76de)

![3](https://github.com/BwithE/shELK/assets/144924113/04807833-3d34-4411-a13d-6cbdeb2b001c)

**_Select "Index Management" and notice we don't see anything! So, we can build some basic results by running the attached ```nmap.sh```_**

![4](https://github.com/BwithE/shELK/assets/144924113/161b31c9-d803-4c67-8801-5871849b308b)


# I WILL UPLOAD MORE SNAPSHOTS SHORTLY #
