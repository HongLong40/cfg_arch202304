#!/bin/zsh

# check if script is already running
for pid in $(pidof -x "polybar_hlwm_handle_events.sh")
do
    if [[ $pid != $$ ]]
    then
        echo "[$(date)] : polybar_hlwm_handle_events.sh : Process is already running with PID $pid"
        exit 1
    fi
done


herbstclient --idle | {

    while read -A event
    do
        if [[ ${event[1]} == "attribute_changed" ]]
        then
            polybar-msg hook hlwm_layout 1 1> /dev/null  2>&1
        fi

        if [[ ${event[1]} =~ "tag_" ]]
        then
            polybar-msg hook hlwm_workspaces 1 1> /dev/null  2>&1
        fi
    done

} 2>/dev/null
