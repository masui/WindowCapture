#osascript -e 'set frontApp to path to frontmost application as Unicode text' -e 'tell application frontApp' -e 'set winID to id of front window' -e 'do shell script "/usr/sbin/screencapture -l " & winID & " -x /tmp/___screen.png"' -e 'end tell'
#/Applications/Gyazo.app/Contents/MacOS/Gyazo /tmp/___screen.png

sleep 4; osascript -e 'set frontApp to path to frontmost application as Unicode text' -e 'tell application frontApp' -e 'set winID to id of front window' -e 'do shell script "/usr/sbin/screencapture -l " & winID & " -x /tmp/___screen.png"' -e 'end tell' -e ' return winID'
