# Using ELK for Network and Wireless analysis.
![dashboard](https://github.com/BwithE/shELK/assets/144924113/d7805792-36ef-4e73-a5f6-c7bbc55c57f0)

** FOR TRAINING PURPOSES ONLY **

We will be able to injest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

I've attached some example data for this install. There are scripts to automate the network and wireless collection if needed.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a **_PRE-BUILT KALI VM_**. 

The user name all the scripts use are ```kali``` and the location of all files and directories are ```/home/kali```.

It creates the proper **_"log"_** and **_"lib"_** directories for the **_"Filebeat.services"_**.

It will copy the modified **_"Filebeat.service"_** files for the different data types.

After, other scripts gets called to create the proper pipelines, objects, and DASHBOARDS.

Based off the data sets that are injested, we will use my pre-built **_Index Patterns, Query Sets, and DASHBOARDS_**.

Lastly, it will copy all the **_"filebeat conf files"_**  to ```/etc/filebeat/```.


# Hands on Keyboards: 
Create a local copy of the script.

```git clone https://github.com/bwithe/shelk```

!!! MAKE SURE TO CD INTO THE "shelk" DIRECTORY BEFORE RUNNING THE FOLLOWING SCRIPT !!!

Make the script executable:

```sudo chmod +x ello-stack.sh```

Then run the script:

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

Once the script is finished running, you will be asked to open your web-browser and go to ```127.0.0.1:5601```

# I WILL UPLOAD MORE SNAPSHOTS AS I UPDATE THE DATA SETS AND SCRIPTS #
