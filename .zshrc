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

# Git branches on the command line.
git_branch_prompt() {
	local branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`

	if [ $branch ]; then
		print "[%F{cyan}$branch%F{default}]"
	fi
}

# Pretty colors for the command line.
export CLICOLOR=1
setopt PROMPT_SUBST
PROMPT="%F{default}[%(!.%F{red}.%F{green})%m %F{blue}%2~%F{default}]"
PROMPT="${PROMPT}\$(git_branch_prompt)"
PROMPT="${PROMPT}%(!.#.\$) "
RPROMPT='%F{blue}%*'

# Antigen bundles:
source ${HOME}/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git

# Shell completion for teamocil.
compctl -g '~/.teamocil/*(:t:r)' teamocil

# Python: use ipython by default.
if [ "`whence ipython`" != "" ]; then
	alias python=ipython
fi

# Local binaries take precedence over all others
if [ -e "${HOME}/bin" ]; then
	export PATH=${HOME}/bin:$PATH
fi

# Finally, local configuration.
if [ -e "${HOME}/.local/zprofile" ]; then
	source ${HOME}/.local/zprofile
fi
