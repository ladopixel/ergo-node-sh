# ergo-node-sh
## Start the Ergo node for thin clients easily with this script.

<img src="https://ergonfts.org/ergo-node-sh.png" alt="Ergo node image"/>

## Steps to run the node
1. Download the .sh file extension
Define your ```api key``` to configure ```ergo.conf``` using the ```my_key``` variable.

2. Add execution permissions from the terminal ```chmod u+x <start_node.sh>```

3. Execute the file ```./<start_node.sh>```
You can specify as the first argument the name of the directory where the Ergo node will be installed and executed. If no argument (name) is specified, a directory named ```ergo_node``` will be created by default.
- Example without argument: ```./start_node.sh```
- Example with argument: ```./start_node.sh <my_directory>```

## Execute other versions
Modify the value of the ```url_ergo``` and ```jar_file``` variables for the version you need to run. Remember that the automatic configuration of the ```ergo.conf``` file may not be compatible with all versions.