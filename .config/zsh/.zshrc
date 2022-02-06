#!/bin/zsh

fpath=("$ZSH" "$fpath[@]")
autoload -Uz compinit promptinit; compinit; promptinit
autoload -Uz check_invoice nms

# Set language environment if it is not set
export LANG=${LANG:-en_US.UTF-8}

# set colors for ls command
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'
export EXA_COLORS='uu=35'

# Set misc. variables
export BC_ENV_ARGS=${HOME}/.config/bc/bcrc
export PATH="/usr/lib/ccache/bin/:$PATH"
export USERNAME
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Load custom configurations
for config_file in $ZSH/*.zsh(N)
do
    source $config_file
done
unset config_file

# history search plugin
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_IGNORE="(ls*|ll*|cd*|cls|exit|poweroff|reboot)"

# Set keys for searching history - widgets are defined in zsh-history-substring-search.zsh,
# so need to bind keys after sourcing the file.
# Arrow Up = "^[OA", Arrow Down = "^[OB"
bindkey -M vicmd "^[OA" history-substring-search-up
bindkey -M viins "^[OA" history-substring-search-up
bindkey -M vicmd "^[OB" history-substring-search-down
bindkey -M viins "^[OB" history-substring-search-down

# bindkey "^[[1~" beginning-of-line
# bindkey "^[[4~" end-of-line

# highlighting plugin -- must be sourced last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=226'

# Set cursor style (DECSCUSR), VT520: echo -ne "\e[_mode_ q"
# _mode_ is one of:
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

# set prompt and cursor.
prompt edward yellow
echo -ne "\e[${prompt_cursor_mode[viins]} q" # Use underline shape cursor on startup.

# check if ${ZDOTDIR}/.zcompdump needs to be (re)compiled
(
    zcompare ${ZDOTDIR}/.zcompdump
) &!