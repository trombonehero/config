# Defined in /tmp/fish.2RFuzK/fish_right_prompt.fish @ line 2
function fish_right_prompt
    set -l last_status $status
    if test $last_status = 0
        set_color $fish_color_end
    else
        set_color $fish_color_error
    end
    echo -n $last_status

    if test $CMD_DURATION
        set dur (echo "$CMD_DURATION 1000" | awk '{printf "%.2fs", $1 / $2}')

        set_color $fish_color_operator
        echo -n ':'(set_color $fish_color_end)$dur
    end

    echo -n ' '
end
