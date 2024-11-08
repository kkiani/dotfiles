if status is-interactive
    # starship
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end

fish_vi_key_bindings

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/key_bindings.fish
source ~/.config/fish/environment.fish
source /usr/local/opt/asdf/libexec/asdf.fish
direnv hook fish | source
zoxide init fish | source
atuin init fish | source
