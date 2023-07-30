local Utils = require("utils")


-- Git Commands
vim.api.nvim_create_user_command("GitStatus", ":!git status", {})
vim.api.nvim_create_user_command("GitAddAll", ":!git add .", {})
vim.api.nvim_create_user_command("GitAddBuffer", function()
    local current_file = vim.api.nvim_buf_get_name(0)
    return Utils.exec({ "Git", "add", current_file })
end, {})
vim.api.nvim_create_user_command("GitPush", ":!git push", {})
vim.api.nvim_create_user_command("GitPushForce", ":!git push --force", {})
vim.api.nvim_create_user_command("GitPull", ":!git pull", {})
vim.api.nvim_create_user_command("GitCommit", ":tab Git commit", {})
vim.api.nvim_create_user_command("GitAmend", ":!git amend", {})
vim.api.nvim_create_user_command("GitDiscard", ":!git discard", {})
vim.api.nvim_create_user_command("GitUncommit", ":!git uncommit", {})
vim.api.nvim_create_user_command("GitUnstage", ":!git unstage", {})
vim.api.nvim_create_user_command("GitCheckout", function()
    local branches = vim.api.nvim_exec('!git branch -a --format "\\%(refname:short)"', true)
    local branch_list = Utils.split_string(branches, "\n")
    table.remove(branch_list, 1)

    Utils.picker({
        title = "Choose a branch to checkout",
        values = branch_list
    }, function(selection)
        Utils.exec({ ":!git", "checkout", selection[1] })
    end)
end, {})
vim.api.nvim_create_user_command("GitGraph", "tab Git log --graph --abbrev-commit", {})


-- CDK
vim.api.nvim_create_user_command("CDKSynth", ":!cdk synth", {})
vim.api.nvim_create_user_command("CDKDeployAll", ":!cdk deploy --all", {})
vim.api.nvim_create_user_command("CDKDestroyAll", ":!cdk destroy --all", {})
