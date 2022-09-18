#!/bin/zsh

typeset padding="    " # 4 spaces
typeset -a tags

# Read tags into $tags as array
tags=( $(herbstclient tag_status) )

for tag in ${tags}
do
    # Read the prefix from each tag and render them according to that prefix
    case ${tag:0:1} in
        '#')
            # the tag is viewed on the focused monitor
            echo -n "%{F-}%{B#3A631C}"
            ;;
        ':')
            # : the tag is not empty
            echo -n "%{F-}%{B#631C3A}"
            ;;
        '!')
            # ! the tag contains an urgent window
            echo -n "%{F-}%{B#FF0000}"
            ;;
        '-')
            # - the tag is viewed on a monitor that is not focused
            echo -n "%{F-}%{B#764E29}"
            ;;
        *)
            # . the tag is empty
            echo -n "%{F#AAAAAA}%{B-}"
            ;;
    esac

    echo -n "%{A1:herbstclient use ${tag:1}:}${padding}${tag:1}${padding}%{A F- B-}"
done

