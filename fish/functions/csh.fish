function csh --description "Cheat sheet under your fingertips"
    set -l languages "fish" "bash" "python" "lua" "vim" "git" "typescript" "rust" "javascript" "c" "c++" "swift"
    set -l selected_lang (printf %s\n $languages | fzf --prompt "Select a language: ")

    read -l query -P "Search for cheat sheets for $selected_lang> "

    curl -s "cht.sh/$selected_lang/$(echo $query | sed 's/ /+/g')" | bat --color=always --file-name="Cheat Sheet (http://cht.sh) | $selected_lang" --language=md
end
