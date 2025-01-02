# homebrew
if test $(uname -m) = "arm64"
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

set -l BREW_PREFIX "$(brew --prefix)"

if status is-interactive
    # starship
    source ($BREW_PREFIX/bin/starship init fish --print-full-init | psub)
end

fish_vi_key_bindings

source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/key_bindings.fish
source ~/.config/fish/environment.fish
source $BREW_PREFIX/opt/asdf/libexec/asdf.fish
direnv hook fish | source
zoxide init fish | source
atuin init fish | source
