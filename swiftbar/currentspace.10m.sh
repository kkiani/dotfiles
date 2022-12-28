current_space=$(yabai -m query --spaces --space | jq ".index")
number_of_spaces=$(yabai -m query --spaces | jq length)
echo "$current_space / $number_of_spaces"
