function pkg --description "Synchronize Homebrew packages"
    argparse 'a/all' 'i/install-only' 'u/uninstall-only' 'e/edit-brewfile' -- $argv
    if set -ql _flag_all
        brew bundle --force cleanup --file ~/.dotfiles/Brewfile
        brew bundle --file ~/.dotfiles/Brewfile
    else if set -ql _flag_install_only
        brew bundle --file ~/.dotfiles/Brewfile
    else if set -ql _flag_uninstall_only
        brew bundle --force cleanup --file ~/.dotfiles/Brewfile
    else if set -ql _flag_edit_brewfile
        nvim ~/.dotfiles/Brewfile
    end
end
