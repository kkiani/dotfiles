#!/bin/zsh
#
# the reason for this script to be bash and not fish is that bash or zsh is available by default on macos

function heading() {
    echo -e "\e[1m\e[34m==>\e[39m $@\e[0m"
}

function warning() {
    echo -e "\e[1m\e[33mWarning:\e[39m $@\e[0m"
}

SELF_PATH="$( cd "$( dirname "$0" )" && pwd )" # Path to the directory containing this script

heading "[brew] installing/updating homebrew..."
# instaling brew
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# intsalling packages from brew
heading "[brew] installing/updating packages..."
brew bundle --file ~/.dotfiles/Brewfile

# create symlinks
heading "[symlinks] installing symbol links..."
for file in `find $SELF_PATH -maxdepth 1 -name \*.symlink`; do
    src_file=`basename "$file"`
    dest_file=`echo "$HOME/.$src_file" | sed "s/\.symlink$//g"`
    if [ -e $dest_file ]; then
        warning "$dest_file already exists; skipping it..."
    else
        ln -sv $SELF_PATH/$src_file $dest_file
    fi
done

# install launchd services
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

# installing configs from dotfiles drive
ln -sv "$HOME/.dotfiles/fish" "$HOME/.config/fish"
ln -sv "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sv "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
ln -sv "$HOME/.dotfiles/yazi" "$HOME/.config/yazi"
ln -sv "$HOME/.dotfiles/ghostty" "$HOME/.config/ghostty"
ln -s "$HOME/.dotfiles/lazygit" "$HOME/.config/lazygit"

# installing configs from icloud drive
heading "[configs] installing icloud drive symlinks..."
ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/.aws" "$HOME/.aws"
ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/Alfred.alfredpreferences" "$HOME/.config/Alfred.alfredpreferences"

# atuin config does not support symlinks, so we copy it instead
cp -r "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/atuin" "$HOME/.config/"
