tell application "System Events"
    set frontApp to first application process whose frontmost is true
    set currApp to name of frontApp
    set frontWindow to front window of frontApp
    -- set currApp to short name of frontApp
    --set windowID to id of front window of currApp
    --do shell script "/usr/sbin/screencapture -l " & windowID & " -x /tmp/___screen.png"
    --do shell script "/usr/sbin/screencapture -l " & 67 & " -x /tmp/___screen.png"
    -- set pos to position of frontWindow
    tell window 1 of frontWindow
       set {xPos, yPos} to position
       set {windowWidth, windowHeight} to size
       return {frontApp, xPos, yPos, windowWidth, windowHeight}
    end tell
end tell

-- return windowID
-- return currApp

-- do shell script "/usr/sbin/screencapture -l 84 -x /tmp/___screen.png"

-- return position of frontWindow
-- return frontWindow




 

