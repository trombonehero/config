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


# Aliases.
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -alh'


# Pretty colors for the command line.
export CLICOLOR=1
PS1="%F{default}[%(!.%F{red}.%F{green})%m %F{blue}%3~%F{default}]%(!.#.\$) "
RPROMPT='%F{blue}%*'

# Android
if [ -d "/usr/local/android" ]; then
	export ANDROID_HOME=/usr/local/android
	export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
fi

# Path
if [ -d "/usr/local/sbin" ]; then
	export PATH=$PATH:/usr/local/sbin
fi

# Python: use ipython by default.
if [ "`whence ipython`" != "" ]; then
	alias python=ipython
fi

# Use the Homebrew version of Python.
if [ -d "/usr/local/bin/brew" ] && [ -d "/usr/local/share/python" ]; then
	export PATH=/usr/local/share/python:$PATH
fi

# Prefer /usr/local/bin/foo to /usr/bin/foo (e.g. Postgresql)
export PATH=/usr/local/bin:$PATH

# Just-for-me binaries (take precedence over all others)
if [ -d "$HOME/bin" ]; then
	export PATH=$HOME/bin:$PATH
fi

