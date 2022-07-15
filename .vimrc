" Pathogen: Vim plugin manager
execute pathogen#infect()

# Reload on SIGUSR1
autocmd SigUSR1 * call reload#ReloadConfig()

" Default to 80-column lines.
if &textwidth == 0 | set textwidth=80 | endif

" Show the last command
set showcmd

" Disable cursor blinking.
set guicursor+=n-v-c:blinkon0

" Disable swap files... this ain't the 70s any more
set noswapfile

" Enhance split-window navigation: Ctrl+HJKL instead of C+W C+HJKL
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Open new split content below or to the right, not above or to the left
set splitbelow
set splitright

" Map Ctrl-S to "write"
map ^S :w<CR>

" Unicode
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8

" searching options
set hlsearch

" line numbers
set number
set numberwidth=5

" line break
set linebreak
set showbreak=>>>\ 

" keep a fair bit of history
set history=256

" always show the status line
set laststatus=2

au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

" default to latex
let g:tex_flavor='latex'

" a sensible status line; a modified version of the one at
" http://got-ravings.blogspot.co.uk/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%f                " filename
set statusline+=\                " space
set statusline+=%h               " help file flag
set statusline+=%m               " modified flag
set statusline+=%r               " read only flag
set statusline+=[%l:             " cursor line
set statusline+=%c]              " cursor column
set statusline+=%=               " left/right separator
set statusline+=\ \ \ \ \ \      " minimum spacing between left & right
set statusline+=%y               " filetype
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}           " file format
set statusline+=]

" Ensure that colours work within screen
if exists('+termguicolors') && ($TERM == "screen-256color" || $TERM == "tmux-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Highlight characters over the textwidth.
let &colorcolumn="+1,+2"
highlight ColorColumn ctermfg=DarkRed

highlight StatusLine cterm=bold ctermbg=DarkBlue ctermfg=Grey

" Show the current cursor location
set cursorline
highlight CursorLine cterm=bold

function! SetCTermInsertColours()
  if &readonly
    highlight CursorLine ctermbg=DarkRed
  else
    highlight CursorLine cterm=bold,underline
  endif
endfunction

au InsertEnter * call SetCTermInsertColours()
au InsertLeave * highlight CursorLine cterm=bold ctermbg=black

" Highlight extra whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
au InsertEnter * highlight ExtraWhitespace ctermbg=red guibg=red

" re-read externally edited files
set autoread

" use syntax highlighting
syntax on

set tabstop=8
set shiftwidth=8

if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" formatting

" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END

" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" Expand tabs to spaces in C++ files only.
set noexpandtab
"autocmd FileType cpp set expandtab

" printing
set printoptions=number:y

" use 'cargo check' by default rather than 'cargo $*'
let g:cargo_makeprg_params = 'check'

" auto-completion
set completeopt=menu,menuone,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'
let g:clang_complete_copen = 1    " show Clang errors in quickfix

" Avoid freezing on offending code
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1

" don't overwrite the background colour of the terminal
set t_ut=

" don't clear the xterm on exit
set t_ti= t_te=

" enable Doxygen comments in C(++)
au! Syntax {c,cpp}
au Syntax {c,cpp} runtime syntax/doxygen.vim

" cscope options
set cscopetag
set csto=0	" check cscope before ctags

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" macOS dark mode
if !has('mac')
    let g:auto_color_switcher#desable = v:true
endif

" Finally, local options to override these defaults...
if filereadable($HOME . '/.local/vimrc')
	source $HOME/.local/vimrc
endif

let g:airline_powerline_fonts = 1

" A nice, warm colour scheme:
colorscheme gruvbox
