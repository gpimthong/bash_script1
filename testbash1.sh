#!/bin/sh
while true;
do
sleep 10;
#fping -c1 -t300 android-8bcb1070db10050f && curl -X POST -d '<?xml version="1.0" encoding="UTF-8" ?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1"><BinaryState>1</BinaryState></u:SetBinaryState></s:Body></s:Envelope>' http://ESP_15FF70:81/upnp/control/basicevent1 || curl -X POST -d '<?xml version="1.0" encoding="UTF-8" ?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1"><BinaryState>0</BinaryState></u:SetBinaryState></s:Body></s:Envelope>' http://ESP_15FF70:81/upnp/control/basicevent1
 

#wget --spider 192.168.1.15:81/on  || wget --spider 192.168.1.15:81/off &
IP='android-8bcb1070db10050f'
fping -c1 -t300 $IP 2>/dev/null 1>/dev/null
if [ "$?" = 0 ]
then
  curl -X POST -d '<?xml version="1.0" encoding="UTF-8" ?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1"><BinaryState>1</BinaryState></u:SetBinaryState></s:Body></s:Envelope>' http://ESP_15FF70:81/upnp/control/basicevent1
else
  curl -X POST -d '<?xml version="1.0" encoding="UTF-8" ?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1"><BinaryState>0</BinaryState></u:SetBinaryState></s:Body></s:Envelope>' http://ESP_15FF70:81/upnp/control/basicevent1
fi

done
