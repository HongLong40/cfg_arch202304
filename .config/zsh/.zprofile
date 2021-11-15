#!/bin/zsh

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    startx ${XDG_CONFIG_HOME}/X11/xinitrc
fi
