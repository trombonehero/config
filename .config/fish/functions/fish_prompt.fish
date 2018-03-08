# name: Informative Vcs
# author: Mariusz Smykula <mariuszs at gmail.com>

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

    echo -n '['(set_color $fish_color_quote)(prompt_hostname) \
        (set_color $color_cwd)(prompt_pwd)(set_color normal)']'

    set git_branch (git rev-parse --abbrev-ref HEAD)
    if set -q git_branch
        echo -n '['(set_color $fish_color_param)"$git_branch"(set_color normal)']'
    end

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n "$suffix "
    set_color normal
end

function fish_right_prompt
    set_color $fish_color_end
    date +%H:%M:%S
    echo -n ' '
end
