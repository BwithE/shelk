# Using ELK for Network and Wireless analysis.

# Wireless dashboard #
![dashboard](https://github.com/BwithE/shELK/assets/144924113/d7805792-36ef-4e73-a5f6-c7bbc55c57f0)
# Network dashboard #
![nmap](https://github.com/BwithE/shelk/assets/144924113/dc5431c1-3f7a-40a7-ad54-3851200e3236)

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

# LETS TAKE A LOOK AT OUR DATA!

Click on the top left menu button and look for "Dashboard"
![1](https://github.com/BwithE/shelk/assets/144924113/7e28001e-a873-44de-99e8-18eeda41a625)

Let's select the pre-built "Dashboard" we've made.
![2](https://github.com/BwithE/shelk/assets/144924113/9a1badd3-6484-4d51-9d9a-63bcfaf1061d)

This dashboard is an example of a wireless collection. 
For example, I used fake restaurants. 
If the "Client-MACaddress" pairs up with an "AP-MACaddress", it means there is an association between the two.
However, if you see a "Client-MACaddress" paired with "(not associated)" but then an AP-SSID. That means the client device has probed for that "SSID" but is not in range, or able to connect.
![3](https://github.com/BwithE/shelk/assets/144924113/953eb3de-2a53-42f9-a589-2b3070343961)

# Other ways we can look at the data, is the Discover tab.
Click on the top left menu button again, and look for "Discover"
![4](https://github.com/BwithE/shelk/assets/144924113/e5bfe669-8e0a-4038-a002-05543b87ae47)

On the left, you can see the "Search Patterns" that we've uploaded. Let's focus in on "local-aps"
![5](https://github.com/BwithE/shelk/assets/144924113/9c2f0194-c40d-41c9-9fbb-019ed2954089)

On the top right menu, we want to filter the data to be read in a faster and cleaner way.
So lets select "open" and then "aps-discover"
Again, this is another "pre-built" query to make this easier.
![6](https://github.com/BwithE/shelk/assets/144924113/c2ce28e4-7d6f-4ff0-ab42-287b9a2ba3c8)

Finally, we can see based off of our "Search-Pattern" (blue arrow)
We have filtered our data to be read at a quick glance. (red arrows)
![7](https://github.com/BwithE/shelk/assets/144924113/8742f8d7-b257-4630-9394-9ffa740fe114)

# I WILL UPLOAD MORE SNAPSHOTS AS I UPDATE THE DATA SETS AND SCRIPTS #
