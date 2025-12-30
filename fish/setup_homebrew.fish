switch (uname)
    case Darwin
        eval "$(/opt/homebrew/bin/brew shellenv)"
    case Linux
        echo "Skipping enabling homebrew on Linux"
    case '*'
        echo "WARN: cannot identify OS for settign up Homebrew."
end