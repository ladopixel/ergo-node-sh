@echo off

REM ┌───────────────────────────┐
REM │ Developed by ladopixel    │
REM │ Execute Ergo node v5.0.13 │
REM └───────────────────────────┘

title Welcome Ergo node


start ergo_node.bat


timeout /t 20


:: I run the API and save the result in your_api_key.txt
set my_key="holaaa"
set "comando_curl=curl -X POST "http://localhost:9053/utils/hash/blake2b" -H "accept: application/json" -H "Content-Type: application/json" -d \""%my_key%\"" > "%USERPROFILE%/ergo_node/your_api_key.txt""
:: I have the api_key generated in your_api_key.txt file
%comando_curl%
echo "[+] api_key created correctlty.


:: Stop node
TASKKILL /FI "WINDOWTITLE eq Closes_by_itself_in_20_seconds"


:: I retrieve the value of the true api_key stored in your_api_key.txt
set "key_file=%USERPROFILE%/ergo_node/your_api_key.txt"
set "key="
< "%key_file%" (
    set /p "key="
)


:: Update ergo.conf with api_key
(
echo ergo {
    echo directory = ${ergo.directory}
    echo networkType = "mainnet"
    echo node.stateType = "digest"
    echo node.blocksToKeep = 1440
    echo node.nipopow.nipopowBootstrap = true
echo }
echo scorex {
    echo restApi {
        echo apiKeyHash = %key%
    echo }
        echo network {
            echo nodeName = "ergo-at-cmd"
            echo agentName = "ergo-at-cmd"
            echo maxConnections = 12
    echo }
echo }
    ) > "%USERPROFILE%/ergo_node/ergo.conf"
echo "[+] ergo.conf updated correctly."


:: Restart node with api_key
set jar_file="ergo-5.0.13.jar"
cd %USERPROFILE%/ergo_node
java -jar %jar_file% --mainnet -c ergo.conf
