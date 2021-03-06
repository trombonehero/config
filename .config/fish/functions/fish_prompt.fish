function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l color_cwd
    set -l suffix

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    echo -n '['

    set_color $fish_color_host
    echo -n (hostname -s)' '

    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    set git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if test $status -eq 0
	set_color $fish_color_operator
        echo -n ':'(set_color $fish_color_param)"$git_branch"(set_color normal)
    end

    set_color normal
    echo -n ']'

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n "$suffix "
    set_color normal
end
