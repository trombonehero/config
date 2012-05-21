" do some Windows-like things (e.g. play nice with highlights and arrow keys)
source $VIMRUNTIME/mswin.vim
behave mswin
set winaltkeys=yes

" Do regular Vim things, too.
source $HOME/.vimrc

" Sensible line lengths.
set columns=84

" I like this font.
set guifont=Droid\ Sans\ Mono:h14

" I like blue.
colorscheme darkblue

