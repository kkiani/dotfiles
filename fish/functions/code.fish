function code "Open a project in VSCode"
    if count $argv > /dev/null
        command code $argv
    else
        command code -r $(find ~/projects -maxdepth 2 -type d | fzf)
    end
end
