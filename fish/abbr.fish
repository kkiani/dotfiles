# git operations
abbr --add gs "git status"
abbr --add gaa "git add ."
abbr --add ga "git add "
abbr --add gam "git amend --no-edit"
abbr --add gpf "git push origin --force"
abbr --add gp "git push origin"
abbr --add gc --set-cursor=! "git commit -m \"!\""
abbr --add lzg "lazygit"

# file operations
abbr --add mkd "mkdir -pv"
abbr --add rmr "rm -rf"
abbr --add dsh "devenv shell"

# quick navigation
abbr --add pr "project"
abbr --add tmp "cd /tmp"

# terraform
abbr --add tf "terraform"
abbr --add tfinit "terraform init"
abbr --add tfval "terraform validate"
abbr --add tffmt "terraform fmt"

# compress and decompress
abbr --add compress "ouch compress"
abbr --add decompress "ouch decompress"
abbr --add archive "ouch compress"
abbr --add unarchive "ouch decompress"

# rust operations
abbr --add cr "cargo run --"

# pdm
abbr --add pdmr "pdm run"
abbr --add pdme "eval (pdm venv activate)"

# python
abbr --add penv "python -m venv .venv"
abbr --add act "source .venv/bin/activate.fish"
abbr --add deact "deactivate"
abbr --add envuv "UV_ENV_FILE=.env uv run"

abbr --add env "env | fzf"

abbr --add lzd "lazydocker"
