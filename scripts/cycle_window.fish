#!/usr/local/bin/fish

set -l current_layout $(yabai -m query --spaces --space | jq -r '.type')

if test "$current_layout" = "stack" 
    yabai -m window --focus stack.next 
    or yabai -m window --focus stack.first
else 
    yabai -m window --focus next 
    or yabai -m window --focus first
end

