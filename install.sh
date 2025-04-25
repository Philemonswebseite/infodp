#!/bin/bash

# Benutzer nach dem Namen des Raspberry Pi fragen
echo "Bitte geben Sie den Namen des Raspberry Pi ein:"
read PI_NAME

# Namen in name.txt speichern
echo "$PI_NAME" > name.txt

# send_serveo_data.sh und infodp.sh zu crontab hinzufügen
(crontab -l 2>/dev/null; echo "@reboot $(pwd)/send_serveo_data.sh") | crontab -
(crontab -l 2>/dev/null; echo "@reboot $(pwd)/infodp.sh") | crontab -
sudo apt-get install wmctrl

echo "Die Skripte wurden erfolgreich zur Crontab hinzugefügt."
sudo shutdown -r now