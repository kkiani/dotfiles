if status is-interactive
    if type -q brew
        set -l BREW_PREFIX "$(brew --prefix)"
        source ($BREW_PREFIX/bin/starship init fish --print-full-init | psub)
    else
        starship init fish | source
    end
end