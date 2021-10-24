#!/usr/bin/env zsh

herbstclient --idle "attribute_changed" 2>/dev/null | {

    while true
    do
        # Read layout of focused frame
        echo $(herbstclient layout | awk '/FOCUS/ { print toupper(substr($2,1,1)) }')

        # wait for next event from herbstclient --idle
        read || break
    done

} 2>/dev/null
