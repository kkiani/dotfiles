#!/bin/zsh

function heading() { 
    echo -e "\e[1m\e[34m==>\e[39m $@\e[0m" 
}

function warning() {
    echo -e "\e[1m\e[33mWarning:\e[39m $@\e[0m" 
}

SELF_PATH="$( cd "$( dirname "$0" )" && pwd )" # Path to the directory containing this script

# instaling brew
function install_brew() {
    heading "[package-manager] installing brew..."
    brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function update_apt() {
    heading "[package-manager] updating apt..."
    sudo apt update
}

# intsalling packages
function install_brew_packages() {
    heading "[packages] installing brew packages..."
    brew bundle --file ~/.dotfiles/packages.macos
}

function install_apt_packages() {
    heading "[packages] installing apt packages..."
    xargs apt-get install < ~/.dotfiles/packages.debian
}


# create symlinks
function install_symlinks() {
    heading "[symlinks] installing public symbol links..."
    for file in `find $SELF_PATH -maxdepth 1 -name \*.symlink`; do
        src_file=`basename "$file"`
        dest_file=`echo "$HOME/.$src_file" | sed "s/\.symlink$//g"`
        if [ -e $dest_file ]; then
            warning "$dest_file already exists; skipping it..."
        else
            ln -sv $SELF_PATH/$src_file $dest_file
        fi
    done
}

# installing espanso configs from icloud drive
function install_private_symlinks() {
    heading "[symlinks] installing private symbol links..."
    ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/espanso" "$HOME/Library/Application Support/espanso"
    ln -sv "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Backups/.aws" "$HOME/.aws"
}

# install launchd services
function install_launchd_services() {
    heading "[services] installing launchd services..."
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
}

function install_systemd_services() {
    heading "[services] installing systemd services..."
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    install_brew
    install_brew_packages
    install_symlinks
    install_private_symlinks
    install_launchd_services
else
    warning "Detect OS type as $OSTYPE."
    update_apt
    install_apt_packages
    install_symlinks

    warning "OS type is $OSTYPE, skipping private symlinks from iClous."
    install_systemd_services
fi
