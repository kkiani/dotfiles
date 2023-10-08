function vcd --description 'Change directory using vifm'
    set dst "$(command vifm --choose-dir - $argv[2..-1])"
    if [ -z "$dst" ];
        echo 'Directory picking cancelled/failed'
        return 1
    end
    z "$dst"
end
