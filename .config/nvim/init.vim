call plug#begin()

" Gruvbox colour scheme
Plug 'ellisonleao/gruvbox.nvim'

" Pretty presentation of diagnostics
Plug 'folke/trouble.nvim'

" DBML: a nice database modeling language
Plug 'jidn/vim-dbml'

" Fzf plugin (includes Ag and Rg)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Icons for the status line
Plug 'kyazdani42/nvim-web-devicons'

" Visualize Git status
Plug 'lewis6991/gitsigns.nvim'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting for the Fish shell
Plug 'nickeb96/fish.vim'

" Required by Telescope
Plug 'nvim-lua/plenary.nvim'

" Fast Lua-based status line
Plug 'nvim-lualine/lualine.nvim'

" Fast fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Tree view plugin
Plug 'nvim-tree/nvim-tree.lua'

" Icons used by trouble.nvim
Plug 'nvim-tree/nvim-web-devicons'

" Handle Git conflict markers
Plug 'rhysd/conflict-marker.vim'

" LLVM IR syntax
Plug 'rhysd/vim-llvm'

" Support for all things Rust
Plug 'rust-lang/rust.vim'

" Git support
Plug 'tpope/vim-fugitive'

" Remove background colours in transparent terminals
Plug 'tribela/vim-transparent'

call plug#end()


" Use default system clipboard where possible
set clipboard+=unnamedplus

" Use line numbers
set number

" Telescope key bindings
nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" Tree view binding
nnoremap <leader>t <cmd>NvimTreeToggle<cr>

" Show textwidth
set colorcolumn=+1,+2

" Use 24b colour in the terminal where possible
set termguicolors

" Use transparency when we can
let g:neovide_transparency=0.9
let g:transparency=0.9

if exists("g:neovide")
	autocmd VimEnter * TransparentDisable
end

" A nice, warm colour scheme
colorscheme gruvbox

" Set up Git status symbols
lua require('gitsigns').setup()

" Set up tree view
lua require("nvim-tree").setup()

" Enable trouble.vim
lua require("trouble").setup()

" Set up status line
autocmd VimEnter * lua require("lualine").setup()

" Finally, local options to override these defaults...
source $HOME/.local/vimrc
