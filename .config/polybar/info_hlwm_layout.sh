#!/usr/bin/env zsh

_layout=$(herbstclient get_attr tags.focus.tiling.focused_frame.algorithm)
echo ${${_layout:0:1}:u}

herbstclient --idle "attribute_changed" 2>/dev/null | {

    while read -A event
    do
        if [[ ${event[2]} = "tags.focus.tiling.focused_frame.algorithm" ]]; then
            echo ${${event[$#event]:0:1}:u}
        fi
    done

} 2>/dev/null
