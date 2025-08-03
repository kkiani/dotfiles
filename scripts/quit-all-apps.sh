#!/bin/bash

# Quit all running applications except Finder and system apps
osascript -e '
tell application "System Events"
    set quitapps to name of every application process whose background only is false and name is not "Finder"
end tell
repeat with appName in quitapps
    tell application appName to quit
end repeat
'
