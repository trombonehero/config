if status is-interactive
    if which atuin
        atuin init --disable-up-arrow fish | source
    end
end
