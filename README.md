# Scripting and ELK.
Scripting and Elasticsearch, Kibana.

**_FIRST: Create a local copy of the script._**

```wget https://raw.githubusercontent.com/BwithE/shELK/main/ello-stack.sh```

**_Make the script executable:_**

```sudo chmod +x ello-stack.sh```

**_Then run the script:_**

```sudo ./ello-stack.sh``` **_or_** ```sudo bash ello-stack.sh```

**_Next, we can go to ```127.0.0.1:5601``` to see Kibana._**

**_Select ```Explore on my own```_**
![explore](https://github.com/BwithE/shELK/assets/144924113/1a71dacb-8382-4933-98c1-33b4f2610f74)


**_To create specific```filebeat.yml``` for data injestion, we need to select the menu on the left and select ```Machine learning```_**
<img width="1680" alt="machinelearning" src="https://github.com/BwithE/shELK/assets/144924113/ddcb5c59-4cc4-4f04-90e2-ad32e476a54d">

**_Under "Import Data" select ```Select File```_**
<img width="1680" alt="importdata" src="https://github.com/BwithE/shELK/assets/144924113/dcdfdabd-c8d7-4547-8da6-268fb0d77e59">

**_Select or Drag and Drop your files that you want analyzed._**
<img width="1680" alt="fileselect" src="https://github.com/BwithE/shELK/assets/144924113/96ece58b-5841-44f5-b044-aff1cddec4d6">

