" Do regular Vim things, too.
source $HOME/.vimrc

" Sensible line lengths.
set columns=84

" I like blue.
colorscheme darkblue

" Show tabs.
set listchars=tab:»\ 
highlight SpecialKey guifg=DarkSlateBlue
au BufRead,BufNewFile * highlight SpecialKey guifg=DarkSlateBlue
set list

" Nicer status line colours.
highlight StatusLine guibg=MidnightBlue guifg=CornflowerBlue

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
