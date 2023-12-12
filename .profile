# Use Vim as the default editor.
export EDITOR=vim


user=`whoami`

if [ "${user}" == "root" ]; then
	export PS1="[\h \w]# "
else
	export PS1="[\h \w]\$ "
fi

if [ "`/usr/bin/which colordiff 2> /dev/null`" != "" ]; then
	alias diff=`/usr/bin/which colordiff`
fi


# Path
if [ -e "/usr/local/sbin" ]; then
	export PATH=$PATH:/usr/local/sbin
fi

# Python: use ipython by default.
if [ "`which ipython 2> /dev/null`" != "" ]; then
	alias python=ipython
fi

# Prefer /usr/local/bin/foo to /usr/bin/foo
export PATH=/usr/local/bin:$PATH

# Just-for-me binaries (take precedence over all others)
if [ -e "${HOME}/bin" ]; then
	export PATH=${HOME}/bin:$PATH
fi

if [ -e "${HOME}/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
