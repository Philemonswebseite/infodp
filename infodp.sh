#!/bin/bash

# URLs der Websites
URL1="https://example.com"
URL2="https://example.org"

# Warte, bis der Desktop-Manager vollständig geladen ist
sleep 10

# Chromium im Kiosk-Modus mit beiden Websites starten
export DISPLAY=:0
chromium-browser --kiosk "$URL1" &
chromium-browser --kiosk "$URL2" &

# Warte kurz, damit beide Fenster geladen werden
sleep 5

# Hinweis: Split View mit `wmctrl` funktioniert möglicherweise nicht im Kiosk-Modus.