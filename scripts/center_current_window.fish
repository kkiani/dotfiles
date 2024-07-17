#!/usr/local/bin/fish

set -l center_x $(math $(yabai -m query --displays --display | jq .frame.w) / 2)
set -l center_y $(math $(yabai -m query --displays --display | jq .frame.h) / 2)
set -l window_center_x $(math $(yabai -m query --windows --window | jq .frame.w) / 2)
set -l window_center_y $(math $(yabai -m query --windows --window | jq .frame.h) / 2)

set -l x $(math $center_x - $window_center_x)
set -l y $(math $center_y - $window_center_y)

yabai -m window --move abs:$x:$y
