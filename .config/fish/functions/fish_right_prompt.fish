# Defined in /tmp/fish.2RFuzK/fish_right_prompt.fish @ line 2
function fish_right_prompt
    set_color $fish_color_end
    date +%H:%M:%S
    echo -n ' '
end
