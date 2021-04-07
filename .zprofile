#!/bin/env zsh

#PS3='Please enter your choice: '
#opts=( "Herbstluft" "i3" "Qtile" )
#select opt in "${opts[@]}"
#do
#    case $opt in
#        "Herbstluft")
#            echo "herbstluftwm --locked" > /tmp/startwm
#            wm="herbstluftwm"
#            break
#            ;;
#        "i3")
#            echo "i3" > /tmp/startwm
#            wm="i3"
#            break
#            ;;
#        "Qtile")
#            echo "qtile start" > /tmp/startwm
#            wm="qtile"
#            break
#            ;;
#        *) echo "invalid option $REPLY";;
#    esac
#done

wm="herbstluftwm"

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    #startx
    startx ~/.xinitrc $wm
fi
