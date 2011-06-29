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


# Aliases
if [ -e "${HOME}/.bash_aliases" ]; then
	source ${HOME}/.bash_aliases
fi

# Android
if [ -e "/usr/local/android" ]; then
	export ANDROID_HOME=/usr/local/android
	export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
fi

# Use the Homebrew version of Python.
if [ -e "/usr/local/bin/brew" ] && [ -e "/usr/local/share/python" ]; then
	export PATH=/usr/local/share/python:$PATH
fi

# Just-for-me binaries (take precedence over all others)
if [ -e "${HOME}/bin" ]; then
	export PATH=${HOME}/bin:$PATH
fi

# Finally, local configuration (e.g. Perforce clients)
if [ -e "${HOME}/.local/profile" ]; then
	source ${HOME}/.local/profile
fi

