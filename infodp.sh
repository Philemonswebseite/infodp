# filepath: vscode-vfs://github/Philemonswebseite/infodp/infodp.sh
#!/bin/bash

# Setze die DISPLAY-Variable
export DISPLAY=:0

# URLs der Websites
URL1="https://infodp.de.cool/ver.php?ic=true"
URL2="https://example.com"

# Warte, bis der Desktop-Manager vollständig geladen ist
sleep 5

# Starte Chromium im App-Modus (ohne Rand) für beide Websites
chromium-browser --app="$URL1" &
sleep 2
chromium-browser --app="$URL2" &

# Warte kurz, damit beide Fenster geladen werden
sleep 5

# Fenster in Split-Screen-Ansicht anordnen
wmctrl -r :ACTIVE: -e 0,0,0,1920,1080  # Linke Hälfte des Bildschirms
wmctrl -r :SELECT: -e 0,1920,0,1920,1080  # Rechte Hälfte des Bildschirms