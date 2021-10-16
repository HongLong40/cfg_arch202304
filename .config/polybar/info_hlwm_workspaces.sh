#!/usr/bin/env bash

herbstclient --idle "tag_*" 2>/dev/null | {

    while true
    do
        typeset padding="    " # 4 spaces

        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}"
            do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
                        # the tag is viewed on the focused monitor
                        echo "%{F-}%{B#355B1A}"
                        ;;
                    ':')
                        # : the tag is not empty
                        echo "%{F-}%{B#5B1A35}"
                        ;;
                    '!')
                        # ! the tag contains an urgent window
                        echo "%{F-}%{B#FF0000}"
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        echo "%{F-}%{B#764E29}"
                        ;;
                    *)
                        # . the tag is empty
                        echo "%{F#AAAAAA}%{B-}"
                        ;;
                esac

                echo "%{A1:herbstclient use ${i:1}:}${padding}${i:1}${padding}%{A F- B-}"
            done

            #echo "%{F-}%{B-}"
        } | tr -d "\n"

        echo

        # wait for next event from herbstclient --idle
        read -r || break
    done

} 2>/dev/null
