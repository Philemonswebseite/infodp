 chromium-browser --kiosk infodp.de.cool/ver.php?ic=true &
    sleep 5
    wmctrl -r Chromium -b remove,fullscreen
    wmctrl -r Chromium -b remove,maximized_vert,maximized_horz
    wmctrl -r Chromium -e 0,0,0,3840,1080