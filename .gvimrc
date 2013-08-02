" do some Windows-like things (e.g. play nice with highlights and arrow keys)
source $VIMRUNTIME/mswin.vim
behave mswin
set winaltkeys=yes

" Do regular Vim things, too.
source $HOME/.vimrc

" Sensible line lengths.
set columns=84

" I like blue.
colorscheme darkblue

" Show tabs.
set listchars=tab:»\ 
au BufRead,BufNewFile * highlight SpecialKey ctermfg=darkgray guifg=DarkSlateBlue
set list

highlight SpecialKey guifg=DarkSlateBlue

" CursorLine colours for the GUI environment.
function SetInsertColours()
  if &readonly
    highlight CursorLine guibg=Red
  else
    highlight CursorLine guibg=DarkOrchid4
  endif
endfunction

highlight CursorLine guibg=MidnightBlue
au InsertEnter * call SetInsertColours()
au InsertLeave * highlight CursorLine guibg=MidnightBlue

" Remove right-hand scrollbar.
set guioptions-=r

" Remove toolbar.
set guioptions-=T

if filereadable($HOME . '/.local/gvimrc')
	source $HOME/.local/gvimrc
endif
