#!/bin/bash

IP=$1
AMASS_DIR="/usr/local/bin/amass"
AMASS_VER="amass_linux_amd64.zip"
AMASS_BIN="https://github.com/OWASP/Amass/releases/download/v3.12.3/$AMASS_VER"
GOWITNESS_DIR="/usr/local/bin/gowitness"
GOWITNESS_VER="gowitness-2.3.4-linux-amd64"
GOWITNESS_BIN="https://github.com/sensepost/gowitness/releases/download/2.3.4/$GOWITNESS_VER"
MASSCAN_DIR="/usr/bin/masscan"

install_tools() {
amass() {
        if [ ! -f $AMASS_DIR ]; then
                wget $AMASS_BIN && unzip $AMASS_VER && mv amass_linux_amd64/amass $AMASS_DIR 
        fi
	echo "Amass is installed and located at $AMASS_DIR"
}
gowitness() {
        if [ ! -f $GOWITNESS_DIR ]; then
                wget $GOWITNESS_BIN && chmod +x $GOWITNESS_VER && mv $GOWITNESS_VER $GOWITNESS_DIR
        fi
	echo "Gowitness is installed and located at $GOWITNESS_DIR"
}
masscan() {
	if [ ! -f $MASSCAN_DIR ]; then
		sudo apt install masscan
	fi
        echo "Masscan is installed and located at $MASSCAN_DIR"
}
amass && gowitness && masscan
}

clean() {
	ls | grep -e "^\a" | xargs rm -rf
}

scout() {
	echo "Test $IP"
}

install_tools && clean && scout
