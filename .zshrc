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
