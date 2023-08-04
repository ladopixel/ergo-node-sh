#!/bin/bash

# ┌───────────────────────────┐
# │ Developed by ladopixel    │
# │ Execute Ergo node v5.0.13 │
# └───────────────────────────┘


# I define my key for the configuration file
my_key="holaaa"


# I define some colors for the messages
texto_verde="\033[32m"
texto_rojo="\033[31m"
reset="\033[0m"


# ERGO
echo
echo "███████"
echo "█"
echo " █"
echo "  █"
echo " █"
echo "█"
echo "███████ ErgoPlatform.org"
echo


# I go to the user's home directory
cd || exit


# The first parameter ($1) is to indicate the name of the directory where everything will be installed, 
# if you do not specify it, it will automatically create a directory in the user's home ergo_node.
if [ $# -gt 0 ]; then
    directory=$1
else
    directory="ergo_node"
fi

if [ ! -d "$directory" ]; then
    mkdir -v "$directory" > /dev/null
    echo -e "${texto_verde}[+] Ergo directory successfully created ${reset}"
else
    echo -e "${texto_rojo}[!] The directory already exists, impossible to create another one with the same name ${reset}"
fi


# I download the node version
url_ergo="https://github.com/ergoplatform/ergo/releases/download/v5.0.13"
jar_file="ergo-5.0.13.jar"
if [ ! -f "$HOME/$directory/$jar_file" ]; then
    curl -LJO $url_ergo/$jar_file 
    mv "$HOME"/$jar_file "$HOME/$directory"
    echo -e "${texto_verde}[+] The node has been successfully downloaded ${reset}"
else
    echo -e "${texto_rojo}[!] You already have an available node ${reset}"
fi


# I verify that a Java version exists in my computer, if it does not exist I show a message.
if ! type -p java > /dev/null; then
    echo -e "${texto_rojo} [-] Java is not installed on your system, you need to install it. ${reset}"
fi


# I create the initial ergo.conf file.
if [ ! -f "$HOME/$directory/ergo.conf" ]; then
    ergo_conf="ergo {"
    echo "$ergo_conf" > "$HOME/$directory/ergo.conf"
    ergo_conf="directory = \${ergo.directory}/$HOME/$directory"
    echo "$ergo_conf" >> "$HOME/$directory/ergo.conf"
    ergo_conf="networkType = \"mainnet\""
    echo "$ergo_conf" >> "$HOME/$directory/ergo.conf"
    ergo_conf="node.stateType = \"digest\""
    echo "$ergo_conf" >> "$HOME/$directory/ergo.conf"
    ergo_conf="node.blocksToKeep = 1440"
    echo "$ergo_conf" >> "$HOME/$directory/ergo.conf"
    ergo_conf="node.nipopow.nipopowBootstrap = true"
    echo "$ergo_conf" >> "$HOME/$directory/ergo.conf"
    ergo_conf="}"
    echo $ergo_conf >> "$HOME/$directory/ergo.conf"
    echo -e "${texto_verde}[+] Configuration file successfully created ${reset}"
fi


# I run the node for the first time
cd "$HOME"/"$directory" || exit
java -jar $jar_file --mainnet -c ergo.conf &


# I store the pid of the node process running at background for the first time
node_process_pid=$!
echo -e "${texto_verde}[+] PID $node_process_pid ${reset}"


# To initialize local node
sleep 20


# known public node http://213.239.193.208:9053/
# local node http://localhost:9053/
# Create my key haciendo uso de la API en mi nodo activo
api_key=$(curl -X POST "http://localhost:9053/utils/hash/blake2b" -H "accept: application/json" -H "Content-Type: application/json" -d "\"$my_key\"")
if [ $? -eq 0 ]; then # Check if the request was successful
  echo -e "${texto_verde}[+] API Response: Api key generated correctly ${reset}"
else
  echo -e "${texto_rojo}[-] Error when querying the API. ${reset}"
fi


# Stop the node 
kill $node_process_pid
echo -e "${texto_verde}[+] Node closed to restart with api_key ${reset}"


# update ergo.conf with api_key
echo_conf="scorex {"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="restApi {"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="apiKeyHash = $api_key"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="}"
echo $echo_conf >> "$HOME/$directory/ergo.conf"
echo_conf="network {"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="nodeName = \"ergo-at-bash\""
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="agentName = \"ergo-at-bash\""
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="maxConnections = 10"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="}"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"
echo_conf="}"
echo "$echo_conf" >> "$HOME/$directory/ergo.conf"


# I start the node with the correctly configured configuration file.
cd "$HOME"/"$directory" || exit
echo -e "${texto_verde}[+] Restarting node ${reset}"
java -jar $jar_file --mainnet -c ergo.conf
