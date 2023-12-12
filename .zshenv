export BUILDENV_SHELL=$SHELL
export EDITOR=vim
export PATH=$PATH:/opt/local/bin

if [ -e "$HOME/.cargo/env" ]
then
	. "$HOME/.cargo/env"
fi
