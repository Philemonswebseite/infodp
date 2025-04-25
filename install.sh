#!/bin/bash

# Benutzer nach dem Namen des Raspberry Pi fragen
echo "Bitte geben Sie den Namen des Raspberry Pi ein:"
read PI_NAME

# Namen in name.txt speichern
echo "$PI_NAME" > name.txt

# Setze Ausführungsrechte für alle Skripte
chmod +x send_serveo_data.sh
chmod +x infodp.sh

# send_serveo_data.sh zu crontab hinzufügen (wird beim Booten ausgeführt)
(crontab -l 2>/dev/null; echo "@reboot $(pwd)/send_serveo_data.sh") | crontab -

# infodp.sh in den Benutzer-Autostart einfügen
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"
cat > "$AUTOSTART_DIR/infodp.desktop" <<EOL
[Desktop Entry]
Type=Application
Exec=bash -c "sleep 10; $(pwd)/infodp.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Infodp
Comment=Start infodp script after login
EOL

# Abhängigkeiten installieren
sudo apt-get install -y wmctrl

echo "Die Skripte wurden erfolgreich eingerichtet."
#sudo shutdown -r now