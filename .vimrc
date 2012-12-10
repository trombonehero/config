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
highlight Tab ctermfg=darkgray guifg=Blue
match Tab /\t/

" Highlight extra whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" re-read externally edited files
set autoread

" use syntax highlighting
syntax on
colorscheme darkblue

set tabstop=3
set shiftwidth=3

" formatting
set cindent
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


" Finally, local options to override these defaults...
if filereadable($HOME . '/.local/vimrc')
	source $HOME/.local/vimrc
endif

