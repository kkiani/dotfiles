function project --description "Open a project from the projects directory"
    set -l selected_line "echo {}"
    set -l prj_files_preview "$selected_line | xargs exa -l -s type --icons"

    z $(find ~/projects -maxdepth 2 -type d -mindepth 2 | \
        fzf --reverse --no-multi --ansi --border=rounded \
            --color='border:green' \
            --border-label="Jumping into a project"\
            --preview="$prj_files_preview" \
    )
end
