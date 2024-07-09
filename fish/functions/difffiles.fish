function difffiles --description "Browse diff of files against a branch"
    set -l branch $argv[1]
    set -l selected "echo {}"
    set -l previewer "$selected | git diff master -- {} | delta -w $COLUMNS"


    git diff --name-only master | \
    fzf --reverse --no-multi --ansi \
        --color='border:green' \
        --border-label="Jumping into a project"\
        --preview="$previewer" \
        --preview-window=up:80%
end
