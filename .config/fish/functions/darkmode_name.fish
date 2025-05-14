function darkmode_name --argument-names time_of_day
    if [ "$time_of_day" = "" ]
        if command which osascript > /dev/null
            if [ (osascript -e 'tell app "System Events" to tell appearance preferences to get dark mode') = "true" ]
                set time_of_day "night"
            else
                set time_of_day "day"
            end
        else
            set time_of_day (sunshine --simple "!@47.5314 -53.2059")
        end
    end

    if [ "$time_of_day" = "night" ]
        echo "dark"
    else
        echo "light"
    end
end
