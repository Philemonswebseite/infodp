#!/bin/bash

# URLs der Websites
URL1="https://example.com"
URL2="https://example.org"

# Warte, bis der Desktop-Manager vollständig geladen ist
sleep 10

# Chromium im Kiosk-Modus mit beiden Websites starten
export DISPLAY=:0
chromium-browser --new-window "$URL1" &
sleep 2
chromium-browser --new-window "$URL2" &

# Warte kurz, damit beide Fenster geladen werden
sleep 5

# Fenster in Split View anordnen (erfordert wmctrl)
wmctrl -r "$URL1" -e 0,0,0,960,1080
wmctrl -r "$URL2" -e 0,960,0,960,1080