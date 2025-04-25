#!/bin/bash

# Pi-Namen aus name.txt lesen
PI_NAME=$(cat $(dirname "$0")/name.txt)

# Starte den Serveo-Tunnel und hole den Port
PORT=$(ssh -o ServerAliveInterval=60 -R 0:localhost:22 serveo.net 2>&1 | grep --line-buffered "Forwarding SSH" | awk '{print $4}' | sed 's/://')

# Überprüfen, ob der Port gefunden wurde
if [ -n "$PORT" ]; then
    # Sende die Daten an den PHP-Webhook
    curl -X POST -d "pi_name=$PI_NAME&serveo_port=$PORT" http://infodp.de.cool/receive_serveo_data.php
else
    # Sende "nicht gefunden" an den PHP-Webhook
    curl -X POST -d "pi_name=$PI_NAME&serveo_port=nicht gefunden" http://infodp.de.cool/receive_serveo_data.php
    echo "Fehler: Serveo Port nicht gefunden."
fi