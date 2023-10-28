# JokeLedgeVoron
Backup for Voron 2.4

`pizzR` is currently only available through GitHub and can be downloaded easily using devtools:

```
#!/bin/bash
# Toogle WIFI-Status at System-Startup

ETHSTATUS=$(sudo ethtool eth0 | tail -n 1 | rev | cut -c 1-2 | rev)

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
