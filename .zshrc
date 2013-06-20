zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/jon/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify
unsetopt beep

bindkey -e

# Report what's going on for long commands.
export REPORTTIME=10


# History searching.
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[3~' delete-char

# Mac-like cursor movement.
bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '[G' backward-kill-word     # opt-backspace
bindkey '[H' kill-word              # opt-delete

# Aliases.
alias diff="`whence colordiff || echo "diff"` -u"
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -alh'


# Pretty colors for the command line.
export CLICOLOR=1
PS1="%F{default}[%(!.%F{red}.%F{green})%m %F{blue}%3~%F{default}]%(!.#.\$) "
RPROMPT='%F{blue}%*'

# Path
if [ -d "/usr/local/sbin" ]; then
	export PATH=$PATH:/usr/local/sbin
fi

# Python: use ipython by default.
if [ "`whence ipython3`" != "" ]; then
	alias python="python3 `whence ipython3`"
elif [ "`whence ipython`" != "" ]; then
	alias python=ipython
fi

# Prefer /usr/local/bin/foo to /usr/bin/foo (e.g. Postgresql)
export PATH=/usr/local/bin:$PATH

# Just-for-me binaries (take precedence over all others)
if [ -d "$HOME/bin" ]; then
	export PATH=$HOME/bin:$PATH
fi

#
# Finally, local configuration: either a zsh-specific profile (which may
# source the generic profile) or, if that doesn't exist, the generic profile.
#
if [ -e "$HOME/.local/zprofile" ]; then
	source $HOME/.local/zprofile
elif [ -e "$HOME/.local/profile" ]; then
	source $HOME/.local/profile
fi
