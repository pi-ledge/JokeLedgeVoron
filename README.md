# JokeLedgeVoron
> *Copyright 2023 [Michael Lechner]. Licensed under the Unlicense.*

Backup for our Voron 2.4



#### Use the following script to toogle WIFI on or off during startup if Ethernet is plugged or not; execute it in /etc/rc.local as sudo:

```
sudo nano /usr/local/bin/disable_wifi_on_ethernet.sh
```
```
#!/bin/bash
# Toogle WIFI-Status at System-Startup

sleep 5

ETHSTATUS=$(sudo ethtool eth0 | tail -n 1 | rev | cut -c 1-3 | rev)

if [ $ETHSTATUS == "yes" ]; then
    /usr/sbin/rfkill block wlan
    #echo WIFI inactive
    #echo "WIFI inactive" | sudo tee -a /home/piledge/wifi_status.txt
else
    /usr/sbin/rfkill unblock wlan
    #echo WIFI active
    #echo "WIFI active" | sudo tee -a /home/piledge/wifi_status.txt
fi
```

#### Use the following udev-rules to toogle WIFI on or off if Ethernet is plugged while system is running:

```
sudo nano /etc/udev/rules.d/70-toogle-wifi-on-ethernet.rules
```
```
ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/sbin/rfkill block wlan"
ACTION=="remove", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/sbin/rfkill unblock wlan"
```
```
sudo udevadm control --reload-rules
```
