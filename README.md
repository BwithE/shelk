# Using ELK for Network RECON.
We will be able to injest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a NEW Debian based OS (PREFERABLY KALI). 

The user name all the scripts use are ```kali``` and the location of all files and directories are ```/home/kali```

It also creates the proper log and lib directories.

Then it copies the modified **_"Filebeat.service"_** which splits into different services based off of data types.

Another script gets called to create the proper pipelines for the data sets.

Then we copy all the **_"filebeat conf files"_** get copied to **_"/etc/filebeat/"_**

FINALLY, we will injest an nmap scan into elastic to create dashboards in Kibana.

# FIRST: 
**_Create a local copy of the script._**

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

**_Notice the location ```/home/kali/SHELK/Scripts/``` and I ran ```bash nmap.sh```. This will ask what IP address we want to scan, for example of this demonstration I used 127.0.0.1._**

**_I also want to mention the ```xml2csv.py``` belongs to @LaconicWolf. We will be using it to convert the nmap.xml data into a .csv format._**

![Screenshot (38)](https://github.com/BwithE/shELK/assets/144924113/c287bf1b-4ce8-4573-bec6-54531afbb046)

**_After that scan has run, and placed the results in ```/home/kali/elk/nmap/*.csv``` the results should be automatically injested into elasticsearch. So, lets refresh our page, notice that we see ```local-nmap``` and a document count._**

![Screenshot (39)](https://github.com/BwithE/shELK/assets/144924113/29fedd77-381c-4f27-8ef7-47faab9656e5)

**_Now we have to create an "Index Pattern" so Kibana can track down our data from the Index we just created._**

![Screenshot (40)](https://github.com/BwithE/shELK/assets/144924113/d376274b-6837-4743-895c-6404d2cd0608)

![Screenshot (41)](https://github.com/BwithE/shELK/assets/144924113/d91e7329-6926-40e0-ad5f-4859064d7d41)

**_Type out ```local-nmap``` and select ```@timestamp``` for the "Timestamp field. Then select "Create index pattern"_**

![Screenshot (42)](https://github.com/BwithE/shELK/assets/144924113/533861ad-c975-46bc-99b9-28e97a27e732)

**_Open the hamburger menu again and select "Discover"_**

![Screenshot (43)](https://github.com/BwithE/shELK/assets/144924113/8733ceff-09ba-4cec-babc-e41f0e52f0cd)

**_FINALLY, We are succesful and can see our recent nmap scan results. On the left column, you can select specifc "Fields" and you will be able to search through the data in a cleaner, faster sense._**

# I WILL UPLOAD MORE SNAPSHOTS AS I UPDATE THE DATA SETS AND SCRIPTS #
