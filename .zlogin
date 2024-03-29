#
# zsh configuration to use when acting as login shell: set PATH, etc.
#

# Path
if [ -d "/usr/local/sbin" ]; then
	export PATH=$PATH:/usr/local/sbin
fi

# Prefer /usr/local/bin/foo to /usr/bin/foo (e.g. Postgresql)
export PATH=/usr/local/bin:$PATH

# Just-for-me binaries (take precedence over all others)
if [ -d "$HOME/bin" ]; then
	export PATH=$HOME/bin:$PATH
fi

# Use local Rust configuration, if one exists
if [ -d "$HOME/.cargo" ] && [ -e "$HOME/.cargo/env" ] ; then
	source $HOME/.cargo/env
fi

#
# Finally, local configuration: either a zsh-specific profile (which may
# source the generic profile) or, if that doesn't exist, the generic profile.
#
if [ -e "$HOME/.local/zlogin" ]; then
	source $HOME/.local/zlogin
elif [ -e "$HOME/.local/zprofile" ]; then
	source $HOME/.local/zprofile
elif [ -e "$HOME/.local/profile" ]; then
	source $HOME/.local/profile
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
