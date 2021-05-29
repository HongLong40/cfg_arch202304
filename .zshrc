# 2021-05-29 Edward Smith Updated vcs_info styles

ZSH="/usr/share/zsh/custom"
fpath=("$ZSH" "$fpath[@]")
autoload -Uz compinit promptinit; compinit; promptinit
autoload -Uz vcs_info

export GIT_PROMPT_COLOR='%F{#d78700}'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/.cfg(|/*)"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:git:*' formats ' ${GIT_PROMPT_COLOR}%s:%b %u%c'
#zstyle ':vcs_info:git:*' formats ' %F{#d78700}⎇  %b%f'
#zstyle ':vcs_info:git:*' formats ' %F{#d78700}-  %b%f'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export MAKEFLAGS="-j13 -l12"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export BC_ENV_ARGS=$HOME/.bcrc
export EDITOR=vim
export PATH="/usr/lib/ccache/bin/:$PATH"
export HOSTNAME=$(print -P %m)
export USERNAME
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export EXA_COLORS='uu=35'

# Load custom configurations
for config_file ($ZSH/*.zsh(N)) { source $config_file }
unset config_file

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# vim style keys for searching history - widgets are defined in zsh-history-substring-search.zsh,
# so need to bind keys after sourcing the file.
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M viins '^k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M viins '^j' history-substring-search-down

bindkey -M vicmd "${terminfo[kcuu1]}" history-substring-search-up
bindkey -M viins "${terminfo[kcuu1]}" history-substring-search-up
bindkey -M vicmd "$terminfo[kcud1]" history-substring-search-down
bindkey -M viins "$terminfo[kcud1]" history-substring-search-down

# bindkey "^[[1~" beginning-of-line
# bindkey "^[[4~" end-of-line

# vi mode
# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

# bindkey -v
# export KEYTIMEOUT=5

# Change cursor shape and right-prompt for different vi modes.
vim_ins_mode="%F{cyan}ins%f"
vim_cmd_mode="%F{magenta}cmd%f"
vim_mode=$vim_ins_mode

prompt_end_ins_char="❯"
prompt_end_cmd_char="ᛞ"
prompt_end_char=$prompt_end_ins_char

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"

    if [[ ${KEYMAP} == vicmd ]]
    then
        # blinking underline cursor
        prompt_end_char=$prompt_end_cmd_char
        echo -ne '\e[3 q'
    else
        # underline cursor
        prompt_end_char=$prompt_end_ins_char
        echo -ne '\e[4 q'
    fi

    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
    prompt_end_char=$prompt_end_ins_char
}
zle -N zle-line-finish

#setopt prompt_subst
prompt edward yellow
RPROMPT='${vim_mode}'
#RPROMPT=\$vcs_info_msg_0_

echo -ne '\e[4 q' # Use underline shape cursor on startup.

HISTORY_IGNORE="(ls*|ll*|cd*|cls|exit|poweroff|reboot)"

# ad-hoc aliases
alias cal='cal --week'
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ga='git add'
alias gb='git branch'
alias gs='git status'
alias gsp='git status --porcelain'

alias hc=herbstclient

# convert number to different base
# function convert() { /home/edward/.config/utils/conv.py $1 $2 $3 }
