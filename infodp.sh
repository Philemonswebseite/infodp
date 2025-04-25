#!/bin/bash

# URLs der Websites
URL1="https://example.com"
URL2="https://example.org"

# Chromium im Kiosk-Modus mit beiden Websites starten
chromium-browser --kiosk "$URL1" --new-window &
chromium-browser --kiosk "$URL2" --new-window &

# Warte kurz, damit beide Fenster geladen werden
sleep 5

# Beide Fenster in Split View anordnen (erfordert ein Fenstermanager-Tool wie wmctrl)
wmctrl -r "$URL1" -e 0,0,0,960,1080
wmctrl -r "$URL2" -e 0,960,0,960,1080