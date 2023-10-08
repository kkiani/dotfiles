function awslogin --description "Login to AWS using aws-vault"
    set -l profile $(aws configure list-profiles | fzf)
    command aws-vault exec "$profile" --prompt=osascript --server
end
