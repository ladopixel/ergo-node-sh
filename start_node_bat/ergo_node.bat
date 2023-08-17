@echo off

REM ┌───────────────────────────┐
REM │ Developed by ladopixel    │
REM │ Execute Ergo node v5.0.13 │
REM └───────────────────────────┘

title Closes_by_itself_in_20_seconds


:: ERGO
echo *******
echo *******
echo **
echo  **
echo   **
echo  **
echo **
echo *******
echo ******* ErgoPlatform.org


cd %USERPROFILE%


set directory="ergo_node"


if not exist "%USERPROFILE%/%directory%" (
    mkdir "%USERPROFILE%/%directory%"
    echo "[+]Ergo directory successfully created"
) else (
    echo "[!]The directory already exists, impossible to create another one with the same name"
)


:: I download the node version
set url_ergo="https://github.com/ergoplatform/ergo/releases/download/v5.0.13"
set jar_file="ergo-5.0.13.jar"

if not exist "%USERPROFILE%/%directory%/%jar_file%" (
    curl -LJO "%url_ergo%/%jar_file%" 
    move "%USERPROFILE%\%jar_file%" "%USERPROFILE%\%directory%\%jar_file%" > nul 2> nul
    echo "[+] The node has been successfully downloaded"
) else (
    echo "[!] You already have an available node"
)


:: I create the initial ergo.conf file
if not exist "%USERPROFILE%/%directory%/ergo.conf" (
    set "profile_new=%USERPROFILE:\=/%"
    set "directory_final=%directory:"=%"
    (
        echo ergo {
        echo directory = ${ergo.directory}
        echo networkType = "mainnet"
        echo node.stateType = "digest"
        echo node.blocksToKeep = 1440
        echo node.nipopow.nipopowBootstrap = true
        echo }
    ) > "%USERPROFILE%/%directory%/ergo.conf"

)


:: I run the node for the first time
cd %USERPROFILE%/%directory%
java -jar %jar_file% --mainnet -c ergo.conf