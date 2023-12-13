" Use default system clipboard where possible
set clipboard+=unnamedplus

" CoC key bindings
nnoremap K <cmd>call CocAction('doHover')<cr>

set tagfunc=CocTagFunc

" Tree view binding
nnoremap <leader>t <cmd>NvimTreeToggle<cr> \| <cmd>TroubleToggle<cr>

" Finally, local options to override these defaults...
source $HOME/.local/vimrc
