function nvim --description "Open current working directory if no argument is passed, otherwise open the file in nvim"
    set -l file $argv[1]

    if test -z $file
        nvim .
    else
        command nvim $file
    end
end
