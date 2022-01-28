# 2021-05-29 Edward Smith Updated vcs_info styles
# 2021-06-13 Edward Smith Moved vcs_info and git aliases to zsh setup files
# 2021-07-11 Edward Smith Added fortune

#export ZSH="/usr/share/zsh/custom"
fpath=("$ZSH" "$fpath[@]")
autoload -Uz compinit promptinit; compinit; promptinit

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=1;35:st=37;44:ex=01;32:'


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export BC_ENV_ARGS=$HOME/.config/bc/bcrc
export PATH="/usr/lib/ccache/bin/:$PATH"
export USERNAME
export EXA_COLORS='uu=35'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Load custom configurations
for config_file in $ZSH/*.zsh(N)
do
    source $config_file
done
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

prompt edward yellow
prompt_set_cursor underline
#echo -ne '\e[4 q' # Use underline shape cursor on startup.

HISTORY_IGNORE="(ls*|ll*|cd*|cls|exit|poweroff|reboot)"

# add push-line-or-edit function
bindkey '^B' push-line-or-edit
fortune

