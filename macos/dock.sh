#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/Applications/Figma.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add '' --type spacer --section apps
dockutil --no-restart --add "/Applications/Slack.app"

killall Dock
