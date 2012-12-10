" Show the last command
set showcmd

" Unicode
set tenc=utf-8

" searching options
set incsearch
set hlsearch

" always show line numbers
set number

" line break
set linebreak
set showbreak=>>>\ 

" Show tabs.
set listchars=tab:»\ 
au BufRead,BufNewFile * highlight SpecialKey ctermfg=darkgray guifg=Blue
set list

" Highlight extra whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Try to preserve the above across colour scheme changes.
au InsertEnter * highlight Tab ctermfg=darkgray guifg=Blue
au InsertEnter * highlight ExtraWhitespace ctermbg=red guibg=red

" re-read externally edited files
set autoread

" use syntax highlighting
syntax on
colorscheme darkblue

" Enable syntax highlighting for LLVM files.
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

set tabstop=3
set shiftwidth=3

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

"set cindent
set formatoptions=croqlt

" printing
set printoptions=number:y

" don't clear the xterm on exit
set t_ti= t_te=

" enable Doxygen comments in C(++)
au! Syntax {c,cpp}
au Syntax {c,cpp} runtime syntax/doxygen.vim

" LLVM colouring
au! BufNewFile,BufRead *.ll set syntax=llvm

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

