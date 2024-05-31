tell application "System Events"
    tell (first application process whose frontmost is true)
        set frontApp to name
        tell window 1
            set {xPos, yPos} to position
            set {windowWidth, windowHeight} to size
            return {frontApp, xPos, yPos, windowWidth, windowHeight}
        end tell
    end tell
end tell
