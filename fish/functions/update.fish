function update --wraps=brew --description 'update system and packages'
    argparse a/all b/brew s/system p/pick -- $argv

    if set -ql _flag_all
        echo (set_color blue)"==>" (set_color normal)"[system] updating macOS..."
        sudo softwareupdate -iR -a

        echo (set_color blue)"==>" (set_color normal)"[homebrew] Updating system packages..."
        brew update && brew upgrade --greedy && brew cleanup

        return 0
    else if set -ql _flag_brew
        echo (set_color blue)"==>" (set_color normal)"[homebrew] Updating system packages..."
        brew update && brew upgrade --greedy && brew cleanup
        return 0
    else if set -ql _flag_system
        echo (set_color blue)"==>" (set_color normal)"[system] updating macOS..."
        sudo softwareupdate -iR -a
        return 0
    else if set -ql _flag_pick
        brew update --quiet
        brew outdated --quiet --greedy \
            | tv --input-header "Select packages to update" \
            | xargs -I {} brew upgrade {}
        return 0
    end
end
