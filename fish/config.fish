source ~/.config/fish/setup_homebrew.fish
source ~/.config/fish/setup_starship.fish

fish_vi_key_bindings

source ~/.config/fish/alias.fish
source ~/.config/fish/abbr.fish
source ~/.config/fish/key_bindings.fish
source ~/.config/fish/environment.fish
direnv hook fish | source
zoxide init fish | source
atuin init fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
