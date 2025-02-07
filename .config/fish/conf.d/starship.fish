if status is-interactive
    if which starship > /dev/null
        starship init fish | source
    end
end
