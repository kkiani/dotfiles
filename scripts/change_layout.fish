#!/usr/local/bin/fish

set -l current_layout $(yabai -m query --spaces --space | jq -r '.type')
set -l current_space $(yabai -m query --spaces --space | jq .index)

if test "$current_layout" = "stack"
    yabai -m config --space $current_space layout bsp
else 
    yabai -m config --space $current_space layout stack 
end
