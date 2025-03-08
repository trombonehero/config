" Use default system clipboard where possible
set clipboard+=unnamedplus

" Telescope + spell checking
noremap zf <Cmd>Telescope spell_suggest<cr>

" Tree view binding
nnoremap <leader>t <cmd>NvimTreeToggle<cr>

" Debugging UI
nnoremap <C-B> <Cmd>lua require("dap").toggle_breakpoint()<CR>
nnoremap <leader>d <cmd>lua require("dapui").toggle()<CR> <cmd>colo gruvbox<CR>
nnoremap <C-n> <Cmd>lua require("dap").step_over()<CR>
nnoremap <C-i> <Cmd>lua require("dap").step_into()<CR>
nnoremap <C-o> <Cmd>lua require("dap").step_out()<CR>
nnoremap <C-c> <Cmd>lua require("dap").continue()<CR>

nnoremap <C-k> <Cmd>lua require("dapui").eval()<CR>
nnoremap <C-k> <Cmd>lua require("dapui").eval()<CR>

" Finally, local options to override these defaults...
source $HOME/.local/vimrc
