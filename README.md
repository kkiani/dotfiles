# Dotfiles
## Introduction
The aim of this repository is to decouple the configuration of system as much as possible so it would be easy to replicate system with the same configuration easily.

## Who can use it?
While the configuretion is personalized to my need, anyone can clone and use it. Keep in mind that these configurations **optimzied for macOS** and some of them might not be applicable to linux distributions.

## How to use it?
> **⚠️IMPORTANT NOTE:** make sure you update the `gitconfig.symlink` and `gitconfig.datachef.symlink` with your own information.

1. Go to your home directory and clone this repo:
    ```bash
    cd ~
    git clone https://github.com/kkiani/dotfiles
    ```
2. Install the files:
   ```bash
    sudo chmod +x install.sh
    ./install.sh
   ```
3. Set up macOS default configurations
   ```bash
   sudo chmod +x macosdefaults.sh
   ./macosdefaults.sh
   ```
## Additional Information
- The repository includes configurations for various tools such as zsh, vscode, and vim.
- The `install.sh` script will create symlinks for the dotfiles in the repository to the appropriate locations on your system. It also, creates links from icloud drive for personal data and the link probabliy does not exist on your drive.
- The `macosdefaults.sh` script includes default configurations for macOS that I personally prefer, but feel free to modify or remove it as needed.
- Be sure to review the contents of the scripts before running them, as they may make changes to your system that you are not comfortable with.
- Feel free to fork and customize the repository to fit your own needs.
