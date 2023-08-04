# ergo-node-sh
Start the Ergo node for thin clients easily with this script.

<img src="https://ergonfts.org/ergo-node-sh.png" alt="Ergo node image"/>

1. Download the .sh file extension
Define your ```api key``` to configure ```ergo.conf``` using the ```my_key``` variable.

2. Add execution permissions from the terminal ```chmod u+x <file.sh>```

3. Execute the file ```./<file.sh>```
You can specify as the first argument the name of the directory where the Ergo node will be installed and executed. If no argument (name) is specified, a directory named ```ergo_node``` will be created by default.
- Example without argument: ```./run_node.sh```
- Example with argument: ```./run_node.sh <my_directory>```