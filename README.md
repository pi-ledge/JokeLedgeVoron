# JokeLedgeVoron
> *Copyright 2023 [Michael Lechner]. Licensed under the MIT license.*

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
    echo deaktivieren
    echo "WIFI deakiviert" | sudo tee -a wifi_status.txt
else
    /usr/sbin/rfkill unblock wlan
    echo aktivieren
    echo "WIFI aktiviert" | sudo tee -a wifi_status.txt
fi
```

#### Use the following udev-rules to toogle WIFI on or off if Ethernet is plugged while system is running:

```
sudo nano /etc/udev/rules.d/70-toogle-wifi-on-ethernet.rules
```
```
ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*", RUN+="/usr/sbin/rfkill block wlan"
ACTION=="remove", SUBSYSTEM=="net", KERNEL=="wlan*", RUN+="/usr/sbin/rfkill block wlan"
```
```
sudo udevadm control --reload-rules
```
