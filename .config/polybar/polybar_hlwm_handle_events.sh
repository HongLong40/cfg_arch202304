#!/bin/zsh

#_layout=$(herbstclient get_attr tags.focus.tiling.focused_frame.algorithm)
#echo ${${_layout:0:1}:u}


# check if script is already running
for pid in $(pidof -x "polybar_hlwm_handle_events.sh")
do
    if [[ $pid != $$ ]]
    then
        echo "[$(date)] : polybar_hlwm_handle_events.sh : Process is already running with PID $pid"
        exit 1
    fi
done


herbstclient --idle 2>/dev/null | {

    while read -A event
    do
        if [[ ${event[1]} == "attribute_changed" ]]
        then
            # echo $event[4]
            polybar-msg hook hlwm_layout 1 1> /dev/null  2>&1
        fi

        if [[ ${event[1]} =~ "tag_" ]]
        then
            # echo $event
            polybar-msg hook hlwm_workspaces 1 1> /dev/null  2>&1
        fi
    done

} 2>/dev/null
