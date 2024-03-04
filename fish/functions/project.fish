function project --description "Open a project from the projects directory"
    set -l selected_line "echo {}"
    set -l prj_files_preview "$selected_line | xargs exa -l -s type --icons"
    set -l go_in_dir "$selected_line | xargs -I {} find {} -maxdepth 1 -type d -mindepth 1"

    z $(find ~/projects -maxdepth 2 -type d -mindepth 2 | \
        fzf --reverse --no-multi --ansi --border=rounded \
            --color='border:green' \
            --border-label="Jumping into a project"\
            --preview="$prj_files_preview" \
            --bind "right:reload($go_in_dir)" \
    )
end
