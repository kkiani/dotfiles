if status is-interactive
    # ~/.config/fish/config.fish
    starship init fish | source
end

fish_vi_key_bindings

source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/key_bindings.fish
source ~/.config/fish/environment.fish
source /usr/local/opt/asdf/libexec/asdf.fish
direnv hook fish | source
zoxide init fish | source
atuin init fish | source
