" Use default system clipboard where possible
set clipboard+=unnamedplus

" Telescope + spell checking
noremap zf <Cmd>Telescope spell_suggest<cr>

" Tree view binding
nnoremap <leader>t <cmd>NvimTreeToggle<cr>

" Finally, local options to override these defaults...
source $HOME/.local/vimrc
