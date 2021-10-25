#!/usr/bin/env zsh

echo $(herbstclient layout | awk '/FOCUS/ { print toupper(substr($2,1,1)) }')

herbstclient --idle "attribute_changed" 2>/dev/null | {

    while read -A event
    do
        if [[ ${event[2]} = "tags.focus.tiling.focused_frame.algorithm" ]]; then
            echo ${${event[$#event]:0:1}:u}
        fi
    done

#    while read event
#    do
#        echo $event | awk ' /focused/ { print toupper(substr($NF,1,1))} '
#    done



#    while true
#    do
#        # Read layout of focused frame
#        echo $(herbstclient layout | awk '/FOCUS/ { print toupper(substr($2,1,1)) }')
#
#        # wait for next event from herbstclient --idle
#        read || break
#    done

} 2>/dev/null
