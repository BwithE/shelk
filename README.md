# Using ELK for Network and Wireless analysis.

# Wireless dashboard #
![dashboard](https://github.com/BwithE/shELK/assets/144924113/d7805792-36ef-4e73-a5f6-c7bbc55c57f0)
# Network dashboard #
![nmap](https://github.com/BwithE/shelk/assets/144924113/dc5431c1-3f7a-40a7-ad54-3851200e3236)

This Bash script is designed to automate the installation and configuration of the Elasticsearch, Kibana, and Filebeat components for managing and analyzing log data.

Here's a breakdown of what each section of the script does:

1. **Elasticsearch Installation:**
   - Downloads Elasticsearch package (version 7.17.9) for AMD64 architecture.
   - Installs Elasticsearch using dpkg.
   - Reloads the systemd daemon and starts the Elasticsearch service.

2. **Kibana Installation:**
   - Downloads Kibana package (version 7.17.9) for AMD64 architecture.
   - Installs Kibana using dpkg.
   - Starts the Kibana service.

3. **Filebeat Installation:**
   - Downloads Filebeat package (version 7.17.9) for AMD64 architecture.
   - Installs Filebeat using dpkg.

4. **Check Elasticsearch and Kibana Status:**
   - Checks if Elasticsearch is running on the default settings (http://127.0.0.1:9200) and prints the status.
   - Checks if Kibana is running on the default settings (http://127.0.0.1:5601) and prints the status.

5. **Filebeat Configuration and Service Setup:**
   - Checks if Filebeat is installed.
   - If Filebeat is installed, it performs the following tasks:
      - Creates specific directories for various log data sets.
      - Copies service files to the required systemd locations.
      - Reloads systemd daemon.
      - Creates pipelines for specific data sets.
      - Moves Filebeat configuration files.
      - Creates directories for storing data forwarded to ELK stack.
      - Starts Filebeat services for different data sets.
      - Enables the listed services.
      - Downloads a Python script for converting Nmap XML to CSV.
      - Copies CSV datasets to specific directories.

6. **Final Message:**
   - Displays a message instructing the user to open their browser and go to http://127.0.0.1:5601 to access Kibana.

Note: The script also includes commented-out sections related to exporting and importing Kibana index patterns, as well as a sleep delay before importing saved objects to allow Elastic time to ingest data.

** FOR TRAINING PURPOSES ONLY **

We will be able to **_index_** and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

I've attached some example data for this install. There are scripts to automate the network and wireless collection if needed.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a **_PRE-BUILT KALI VM_**. 

The user name all the scripts use are ```kali``` and the location of all files and directories are ```/home/kali```.

It creates the proper **_"log"_** and **_"lib"_** directories for the **_"Filebeat.services"_**.

It will copy the modified **_"Filebeat.service"_** files for the different data types.

After, other scripts gets called to create the proper pipelines, objects, and DASHBOARDS.

Based off the data sets that are **_indexed_**, we will use my pre-built **_Index Patterns, Query Sets, and DASHBOARDS_**.

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
