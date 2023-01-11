#!/bin/zsh

function heading() { 
    echo -e "\e[1m\e[34m==>\e[39m $@\e[0m" 
}

function warning() {
    echo -e "\e[1m\e[33mWarning:\e[39m $@\e[0m" 
}

# Uncomment the following line to delete all symlinks at the root of $HOME - useful for reinstalls
# find "$HOME" -maxdepth 1 -type l -exec rm -f {} \;

SELF_PATH="$( cd "$( dirname "$0" )" && pwd )" # Path to the directory containing this script

# Create symlinks
heading "[symlinks] insstalling symbol links..."
for file in `find $SELF_PATH -maxdepth 1 -name \*.symlink`; do
    src_file=`basename "$file"`
    dest_file=`echo "$HOME/.$src_file" | sed "s/\.symlink$//g"`
    if [ -e $dest_file ]; then
        warning "$dest_file already exists; skipping it..."
    else
        ln -sv $SELF_PATH/$src_file $dest_file
    fi
done

# Install launchd services
heading "[launchd] installing launcd services..."
for file in `find $SELF_PATH/services -maxdepth 1 -name \*.plist`; do
    file_name=$(basename $file)
    dest_file="$HOME/Library/LaunchAgents/$file_name"
    if [ -e $dest_file ]
    then
        warning "$dest_file already exists; skipping it..."
    else
        ln -s "$SELF_PATH/services/$file_name" "$dest_file"
        user_id=$(id -u)
        sudo launchctl bootstrap gui/"$user_id" $dest_file
    fi
done

# installing espanso configs from icloud drive
heading "[symlinks] installing icloud drive symlinks..."
ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/espanso" "$HOME/Library/Application Support/espanso"
ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/.aws" "$HOME/.aws"


# vim -c ':call coc#util#install()'

# echo "Updating termcap database..."
# $SELF_PATH/term/term.sh

# Needed on macOS Catalina. Source: https://stackoverflow.com/a/22753363
# compaudit | xargs chmod g-w
