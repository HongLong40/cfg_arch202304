# set XDG variables.
# source: https://wiki.archlinux.org/index.php/XDG_Base_Directory

export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_CACHE_HOME="$HOME/.cache" 
export XDG_DATA_HOME="$HOME/.local/share" 

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/X11/xcompose
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"

# Compilation flags
export MAKEFLAGS="-j13 -l12"

# disable LESSHISTFILE
export LESSHISTFILE=-

# default editor
export EDITOR=vim
