# ergo-node-sh
## Start the Ergo node for thin clients easily with this script.

<img src="https://ergonfts.org/ergo-node-sh.png" alt="Ergo node image"/>

## Steps to run the node v1
1. [Download ```start_node.sh```](https://github.com/ladopixel/ergo-node-sh/blob/main/start_node.sh)
In the code of this file define your ```api key``` to configure ```ergo.conf``` using the ```my_key``` variable.

2. Add execution permissions from the terminal ```chmod u+x start_node.sh```

3. Execute the file ```./start_node.sh```
You can specify as the first argument the name of the directory where the Ergo node will be installed and executed. If no argument (name) is specified, a directory named ```ergo_node``` will be created by default.
- Example without argument: ```./start_node.sh```
- Example with argument: ```./start_node.sh <my_directory>```

<hr>

## Steps to run the node with start_node v2
Version 2 varies only in the way the api_key is entered. With this version it is not necessary to access the code, it is configured during execution.
1. [Download ```start_node_v2.sh```](https://github.com/ladopixel/ergo-node-sh/blob/main/start_node_v2.sh)
2. Add execution permissions from the terminal ```chmod u+x start_node_v2.sh```
3. Execute the file ```./start_node_v2.sh```

###### The idea of requesting the api_key during execution has been from n1ur0 ######

## Execute other versions
Modify the value of the ```url_ergo``` and ```jar_file``` variables for the version you need to run. Remember that the automatic configuration of the ```ergo.conf``` file may not be compatible with all versions.

<hr>

# Windows
Download the two files located in the directory [```start_node_bat```](https://github.com/ladopixel/ergo-node-sh/tree/main/start_node_bat)
- [Download ```index_node.bat```](https://github.com/ladopixel/ergo-node-sh/blob/main/start_node_bat/index_node.bat)
- [Download ```ergo_node.bat```](https://github.com/ladopixel/ergo-node-sh/blob/main/start_node_bat/ergo_node.bat)

## API key
**Set the variable** ```my_key``` in the first lines of the ```index_node.bat``` file.

Modify this line of code: ```set my_key="holaaa"```
For this one: ```set my_key="your_key"```

## Execute this .bat file
Open cmd console and type the following: ```index_node``` and press enter.

### Security
Remember to put in a safe place the generated file ```your_api_key.txt``` with your api_key in the ```ergo_node``` folder.