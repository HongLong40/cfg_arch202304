#!/bin/zsh

fpath=("$ZSH" "$fpath[@]")
autoload -Uz promptinit add-zsh-hook
autoload -Uz check_invoice nms
promptinit

# Set language environment if it is not set
export LANG=${LANG:-en_US.UTF-8}

# set colors for ls command
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'
export EXA_COLORS='uu=35'

# Load completions - must be loaded before other custom configurations
source ${ZSH}/completion.zsh

# Set misc. variables
export BC_ENV_ARGS=${HOME}/.config/bc/bcrc
export PATH="/usr/lib/ccache/bin/:$PATH"
export USERNAME
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Load custom configurations
source ${ZSH}/xdg_vars.zsh

source ${ZSH}/aliases.zsh
source ${ZSH}/directories.zsh
source ${ZSH}/history.zsh
source ${ZSH}/functions.zsh
source ${ZSH}/termsupport.zsh

# history search plugin
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_IGNORE="(ls*|ll*|cd*|cls|exit|poweroff|reboot)"

# Keys for searching history-widgets are defined in zsh-history-substring-search.zsh,
# so need to bind keys after sourcing the file.
source ${ZSH}/key-bindings.zsh

# set prompt and cursor.
prompt edward yellow
echo -ne "\e[${prompt_cursor_mode[viins]} q" # Use underline shape cursor on startup.

# load autojump
source /usr/share/autojump/autojump.zsh

# check if ${ZDOTDIR}/.zcompdump needs to be (re)compiled
zcompare ${ZDOTDIR}/.zcompdump &!

# highlighting plugin -- must be sourced last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=226'

# disable highlighting for pasted strings
zle_highlight+=('paste:none')

