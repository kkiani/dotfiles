current_space=$(yabai -m query --spaces --space | jq ".index")
echo "$current_space / 4"
