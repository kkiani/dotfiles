function project --description "Open a project from the projects directory"
    set -l prj_dir $(find ~/projects -maxdepth 2 -type d -mindepth 2 | fzf)
    nvim $prj_dir
end
