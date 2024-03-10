function open --description "Open a file or folder with default application"
    set -l file $argv[1]

    if test -z $file
        open $(xplr)
    else
        command open $file
    end
end
