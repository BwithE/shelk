# Using ELK for Network RECON.
I created a bash script to install Elasticsearch, Kibana and Filebeat on a Debian based OS. (NO LOGSTASH)
After ELK is installed, I injest an nmap scan into elastic.

Once installed, by default, they will be listening on localhost and their associated ports.

Elasticsearch ```127.0.0.1:9200``` && Kibana ```127.0.0.1:5601```

**_FIRST: Create a local copy of the script._**

```wget https://raw.githubusercontent.com/BwithE/shELK/main/ello-stack.sh```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

**_Next, in a web-browser, we can go to ```127.0.0.1:5601``` to see Kibana._**

**_Select ```Explore on my own```_**

![explore](https://github.com/BwithE/shELK/assets/144924113/1a71dacb-8382-4933-98c1-33b4f2610f74)


**_To create specific```filebeat.yml``` for data injestion, we need to select the menu on the left and select ```Machine learning```_**

<img width="1680" alt="machinelearning" src="https://github.com/BwithE/shELK/assets/144924113/ddcb5c59-4cc4-4f04-90e2-ad32e476a54d">

**_Under "Import Data" select ```Select File```_**

<img width="1680" alt="importdata" src="https://github.com/BwithE/shELK/assets/144924113/dcdfdabd-c8d7-4547-8da6-268fb0d77e59">

**_Select or Drag and Drop your files that you want analyzed._**

<img width="1680" alt="fileselect" src="https://github.com/BwithE/shELK/assets/144924113/96ece58b-5841-44f5-b044-aff1cddec4d6">

**_For this example, I will use nmap results from my localhost machine. I used @LaconicWolf xml2csv.py script to convert my nmap.xml into a ".csv" so Elasticsearch can analyze it._**

![Screenshot 2023-11-10 at 3 11 48 PM](https://github.com/BwithE/shELK/assets/144924113/1d1a9c1f-3b51-4323-91fe-eb1cf2933ac2)

**_If I scroll down, I can see some of the results that are listed. Make sure to "import"._**

![Screenshot 2023-11-10 at 3 12 11 PM](https://github.com/BwithE/shELK/assets/144924113/2ca7b3d1-ec6e-416b-8067-771c7d4c1665)

**_Next, we can name the INDEX "home-nmap" and then "import"._**

![Screenshot 2023-11-10 at 3 12 50 PM](https://github.com/BwithE/shELK/assets/144924113/74e52053-3df8-46f9-be31-eafc76d3a7b5)

**_Once everything been uploaded, you can scroll to the bottom and click the "CREATE FILEBEAT CONFIGURATION"_**

![Screenshot 2023-11-10 at 3 13 06 PM](https://github.com/BwithE/shELK/assets/144924113/445680a2-1329-44e7-9ff4-cddcb2cc067d)

**_You will see something like the following. Copy those contents into your "/etc/filebeat/filebeat.yml"_**
**_This will allow all new "*.csv" files with the same format to be injested into Elasticsearch._**


![Screenshot 2023-11-10 at 3 13 17 PM](https://github.com/BwithE/shELK/assets/144924113/5c1e81bf-5730-403b-98a7-80569eeba0fe)

**_FINALLY, we can go to the "Discover" tab and view our "home-nmap" results._**

<img width="1680" alt="Screenshot 2023-11-10 at 3 29 00 PM" src="https://github.com/BwithE/shELK/assets/144924113/385b1e2d-a681-4f61-8642-47406051648b">
