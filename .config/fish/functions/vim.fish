function vim
    if which nvim > /dev/null
        nvim $argv
    else
        command vim $argv
    end
end
