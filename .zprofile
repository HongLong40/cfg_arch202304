#!/bin/zsh
if [[ -f /usr/share/zsh/custom/xdg_vars.zsh ]]
then
    source /usr/share/zsh/custom/xdg_vars.zsh
fi


if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]
then
    startx ${HOME}/.config/X11/xinitrc
fi
