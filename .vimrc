" Default to 80-column lines.
set textwidth=80

" Show the last command
set showcmd

" Allow backspace.
set backspace=start,indent,eol

" Unicode
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8

" searching options
set incsearch
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

" Enable syntax highlighting for LLVM files.
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

set tabstop=8
set shiftwidth=8

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

" auto-completion
set completeopt=menu,menuone,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'
let g:clang_complete_copen = 1    " show Clang errors in quickfix

" don't clear the xterm on exit
set t_ti= t_te=

" enable Doxygen comments in C(++)
au! Syntax {c,cpp}
au Syntax {c,cpp} runtime syntax/doxygen.vim

" LLVM colouring
au! BufNewFile,BufRead *.ll set syntax=llvm

"" cscope options
"set cscopetag
"set csto=0	" check cscope before ctags
"
"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


autocmd BufRead *.yy let g:yacc_uses_cpp=1 | set syntax=yacc

" Finally, local options to override these defaults...
if filereadable($HOME . '/.local/vimrc')
	source $HOME/.local/vimrc
endif

