function project --description "Open a project from the projects directory"
    set selected_project (find ~/projects -maxdepth 2 -type d -mindepth 2 | \
        tv --preview="bat --color=always -p {}/README.md || echo No README file is available." \
            --custom-header "Select a project to open" \
    )

    if test -z "$selected_project"
        echo "No project selected."
        return 1
    else
        cd "$selected_project" || return 1
        if test -f .venv/bin/activate.fish
            source .venv/bin/activate.fish
        end
    end
end
