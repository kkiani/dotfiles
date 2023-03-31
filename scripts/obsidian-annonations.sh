#!/bin/bash

# copy selelected text to clipboard
skhd -k "cmd - c"

# get the page id of current note in obsidian
OBSIDIAN_VAULT_PATH='/Users/kiarash/Library/Mobile Documents/iCloud~md~obsidian/Documents/Primary Vault'
CURRENT_PAGE_ID=$(cat "$OBSIDIAN_VAULT_PATH/.obsidian/workspace.json" | jq -r '.main.children | .[0].children | .[0].state.state.file')

# edit the copied text
echo "- $(pbpaste)" | pbcopy

open "obsidian://advanced-uri?vault=Primary%20Vault&filepath=$CURRENT_PAGE_ID&clipboard=true&mode=append"
