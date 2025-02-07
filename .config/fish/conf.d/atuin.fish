if status is-interactive
    if which atuin > /dev/null
        atuin init --disable-up-arrow fish | source
    end
end
