# Using ELK for Network analysis.
** FOR TRAINING PURPOSES ONLY **

We will be able to injest and visualize nmap scans, breakdown wireless beacons and probes, and find vendors based off of OUI data sets.

The bash script ```ello-stack.sh``` will install Elasticsearch, Kibana and Filebeat on a **_PRE-BUILT KALI VM_**. 

The user name all the scripts use are ```kali``` and the location of all files and directories are ```/home/kali```.

It creates the proper **_"log"_** and **_"lib"_** directories for the **_"Filebeat.services"_**.

It will copy the modified **_"Filebeat.service"_** files for the different data types.

After, another script gets called to create the proper pipelines for the data sets.

Based off the data sets that are injested, you can also use my pre-built **_Index Patterns_**.

Lastly, it will copy all the **_"filebeat conf files"_**  to ```/etc/filebeat/```.


# Hands on Keyboards: 
Create a local copy of the script.

```git clone https://github.com/bwithe/shELK```

Make the script executable:

```sudo chmod +x ello-stack.sh```

Then run the script:

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

Once the script is finished running, you will be asked to open your web-browser and go to ```127.0.0.1:5601```

Select **_"Explore on my own"_**

![1explore](https://github.com/BwithE/shELK/assets/144924113/415cc467-138f-4b79-b4f6-c853296ef53d)

Select the drop down menu on the top left, and scroll all the way down to the bottom. Select **_"Stack Management"_**

![2](https://github.com/BwithE/shELK/assets/144924113/e8aadcbd-c934-4527-9830-2914c4aa76de)

![3](https://github.com/BwithE/shELK/assets/144924113/04807833-3d34-4411-a13d-6cbdeb2b001c)

Select **_"Index Management"_** and notice we don't see anything! So, we can build some basic results by running the attached ```nmap.sh```

![4](https://github.com/BwithE/shELK/assets/144924113/161b31c9-d803-4c67-8801-5871849b308b)

Notice the location ```/home/kali/SHELK/Scripts/``` and I ran ```bash nmap.sh```. This will ask what IP address we want to scan, for example of this demonstration I used 127.0.0.1

I also want to mention the ```xml2csv.py``` belongs to @LaconicWolf. We will be using it to convert the nmap.xml data into a .csv format.

![Screenshot (38)](https://github.com/BwithE/shELK/assets/144924113/c287bf1b-4ce8-4573-bec6-54531afbb046)

After that scan has run, and placed the results in ```/home/kali/elk/nmap/*.csv``` the results should be automatically injested into elasticsearch. So, lets refresh our page, notice that we see ```local-nmap``` and a document count.

![Screenshot (39)](https://github.com/BwithE/shELK/assets/144924113/29fedd77-381c-4f27-8ef7-47faab9656e5)

Now we have to create an **_"Index Pattern"_** so Kibana can track down our data from the Index we just created.

![Screenshot (40)](https://github.com/BwithE/shELK/assets/144924113/d376274b-6837-4743-895c-6404d2cd0608)

![Screenshot (41)](https://github.com/BwithE/shELK/assets/144924113/d91e7329-6926-40e0-ad5f-4859064d7d41)

Type out ```local-nmap``` and select ```@timestamp``` for the "Timestamp" field. Then select **_"Create index pattern"._**

![Screenshot (42)](https://github.com/BwithE/shELK/assets/144924113/533861ad-c975-46bc-99b9-28e97a27e732)

Open the hamburger menu again and select **_"Discover"._**

![Screenshot (43)](https://github.com/BwithE/shELK/assets/144924113/8733ceff-09ba-4cec-babc-e41f0e52f0cd)

FINALLY, We are succesful and can see our recent nmap scan results. On the left column, you can select specifc **_"Fields"_** and you will be able to search through the data in a cleaner, faster manner.

![Screenshot (45)](https://github.com/BwithE/shELK/assets/144924113/c6c82f77-3ed1-456f-bd92-e8a3267b6f44)

# I WILL UPLOAD MORE SNAPSHOTS AS I UPDATE THE DATA SETS AND SCRIPTS #
