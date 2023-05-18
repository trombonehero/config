call plug#begin()

" Gruvbox colour scheme
Plug 'ellisonleao/gruvbox.nvim'

" Pretty presentation of diagnostics
Plug 'folke/trouble.nvim'

" DBML: a nice database modeling language
Plug 'jidn/vim-dbml'

" Icons for the status line
Plug 'kyazdani42/nvim-web-devicons'

" Visualize Git status
Plug 'lewis6991/gitsigns.nvim'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting for the Fish shell
Plug 'nickeb96/fish.vim'

" Fast Lua-based status line
Plug 'nvim-lualine/lualine.nvim'

" Icons used by trouble.nvim
Plug 'nvim-tree/nvim-web-devicons'

" Handle Git conflict markers
Plug 'rhysd/conflict-marker.vim'

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

" Enable trouble.vim
lua require("trouble").setup()

" Set up status line
autocmd VimEnter * lua require("lualine").setup()

" Finally, local options to override these defaults...
source $HOME/.local/vimrc
