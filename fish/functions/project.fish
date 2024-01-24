function project --description "Open a project from the projects directory"
    set -l prj_dir $(find ~/projects -maxdepth 2 -type d -mindepth 2 | fzf --border=rounded --color='border:green' --border-label="Jumping into a project")
    z $prj_dir
end
