require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.9,
                height = 0.9,
                preview_width = 0.6
            }
            -- other layout configuration here
        },
        file_ignore_patterns = {
            "node_modules",
            ".venv",
            ".git",
            ".vscode"
        }
    },
})
