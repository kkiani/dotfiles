function explore --description 'Clone a repository temporary to explore with default editor'
    cd /tmp
    git clone $argv[1]
    cd $(basename $argv[1] .git)
    $EDITOR .
end
