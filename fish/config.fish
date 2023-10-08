if status is-interactive
    # ~/.config/fish/config.fish
    starship init fish | source
end

source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source /usr/local/opt/asdf/libexec/asdf.fish
direnv hook fish | source
zoxide init fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

