" Do regular Vim things, too.
source $HOME/.vimrc

" Sensible line lengths.
let &columns=&textwidth + 7

" Show tabs.
set listchars=trail:·,precedes:«,extends:»,tab:»\ 
highlight SpecialKey guifg=DarkSlateBlue
au BufRead,BufNewFile * highlight SpecialKey guifg=DarkSlateBlue
set list

" Add font size manipulation
map <m--> <Plug>(fontzoom-smaller)
map <m-=> <Plug>(fontzoom-larger)

" Remove scrollbars.
set guioptions-=r
set guioptions-=L

" Remove toolbar.
set guioptions-=T

" Remove menu bar.
set guioptions-=m

if filereadable($HOME . '/.local/gvimrc')
	source $HOME/.local/gvimrc
endif
