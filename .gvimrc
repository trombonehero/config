" Do regular Vim things, too.
source $HOME/.vimrc

" Sensible line lengths.
let &columns=&textwidth + 7

" Show tabs.
set listchars=trail:·,precedes:«,extends:»,tab:»\ 
highlight SpecialKey guifg=DarkSlateBlue
au BufRead,BufNewFile * highlight SpecialKey guifg=DarkSlateBlue
set list

" Remove scrollbars.
set guioptions-=r
set guioptions-=L

" Remove toolbar.
set guioptions-=T

" Set up colour schemes that vary according to sunrise and sunset.
let g:nd_latitude = '50'
let g:nd_timeshift = '10'
let g:nd_themes = [
  \ ['sunrise+0',  'vimspectr210curve-light', 'light' ],
  \ ['sunrise+7/8', 'vimspectr210wcurve-dark', 'dark' ],
  \ ['sunset+1/4', 'vimspectr60flat-dark',    'dark' ],
  \ ]

call plug#begin('~/.vim/plugged')
Plug 'nightsense/night-and-day'
Plug 'nightsense/vimspectr'
call plug#end()

if filereadable($HOME . '/.local/gvimrc')
	source $HOME/.local/gvimrc
endif
