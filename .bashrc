# Use Vim as the default editor.
export EDITOR=vim


# Pretty colours and bash prompt
export CLICOLOR=1

CSTART='\[\033[';
CEND='\]';
RED="${CSTART}01;31m${CEND}"
GREEN="${CSTART}01;32m${CEND}"
YELLOW="${CSTART}01;33m${CEND}"
BLUE="${CSTART}01;34m${CEND}"
NONE="${CSTART}00m${CEND}"

user=`whoami`

if [ "${user}" == "root" ]; then
	export PS1="[${RED}\h ${BLUE}\w${NONE}]# "
else
	export PS1="[${GREEN}\u@\h ${BLUE}\w${NONE}]\$ "
fi

if [ "`/usr/bin/which colordiff`" != "" ]; then
	alias diff=`/usr/bin/which colordiff`
fi


# Aliases
if [ -e "${HOME}/.bash_aliases" ]; then
	source ${HOME}/.bash_aliases
fi

# Android
if [ -e "/usr/local/android" ]; then
	export ANDROID_HOME=/usr/local/android
	export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
fi

# Path
if [ -e "/usr/local/sbin" ]; then
	export PATH=$PATH:/usr/local/sbin
fi

# Python: use ipython by default.
if [ "`which ipython`" != "" ]; then
	alias python=ipython
fi

# Use the Homebrew version of Python.
if [ -e "/usr/local/bin/brew" ] && [ -e "/usr/local/share/python" ]; then
	export PATH=/usr/local/share/python:$PATH
fi

# Prefer /usr/local/bin/foo to /usr/bin/foo (e.g. Postgresql)
export PATH=/usr/local/bin:$PATH

# Just-for-me binaries (take precedence over all others)
if [ -e "${HOME}/bin" ]; then
	export PATH=${HOME}/bin:$PATH
fi

# Finally, local configuration (e.g. Perforce clients)
if [ -e "${HOME}/.local/profile" ]; then
	source ${HOME}/.local/profile
fi

