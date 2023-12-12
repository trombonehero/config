export BUILDENV_SHELL=$SHELL
export EDITOR=vim
export PATH=$PATH:/opt/local/bin

if [ -d "$HOME/.cargo" ] && [ -e "$HOME/.cargo/env" ]
then
	. "$HOME/.cargo/env"
fi
