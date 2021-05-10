#!/bin/bash

AMASS_ZIP="amass_linux_amd64.zip"
AMASS_BIN="https://github.com/OWASP/Amass/releases/download/v3.12.3/$AMASS_ZIP"

amass() {
        if [ ! -f /usr/local/bin/amass ]; then
                wget $AMASS_BIN && unzip $AMASS_ZIP && mv amass_linux_amd64/amass /usr/local/bin/ 
        fi
}
clean() {
	ls | grep -e "^\a" | xargs rm -rf
}
amass && clean
