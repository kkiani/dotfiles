# This script will automatically run at login using macOS launchd service.
# launchd service file: ~/Library/LaunchAgents/com.user.loginscript.plist
# author: kiarash kiani
# email: kiani@kiarash.us


rm -rf $HOME/projects/temp && mkdir $HOME/projects/temp
