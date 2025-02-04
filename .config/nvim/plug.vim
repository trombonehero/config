" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	echo "plug.vim not found, downloading... "
  	silent !curl --silent --show-error --fail --location 
		\ --create-dirs
		\ --output ~/.config/nvim/autoload/plug.vim
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "plug.vim installed"
endif

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

" Jinja2 syntax
Plug 'lepture/vim-jinja'

" Colours
Plug 'norcalli/nvim-colorizer.lua'

" Show Typst emoji, etc.
Plug 'MrPicklePinosaur/typst-conceal.vim', {'for': 'typst'}

" Syntax highlighting for the Fish shell
Plug 'nickeb96/fish.vim'

" LSP and Mason
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Required by Telescope
Plug 'nvim-lua/plenary.nvim'

" Fast Lua-based status line
Plug 'nvim-lualine/lualine.nvim'

" Fast fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

" Tree view plugin
Plug 'nvim-tree/nvim-tree.lua'

" Icons used by trouble.nvim
Plug 'nvim-tree/nvim-web-devicons'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Man pages
Plug 'paretje/nvim-man'

" Handle Git conflict markers
Plug 'rhysd/conflict-marker.vim'

" LLVM IR syntax
Plug 'rhysd/vim-llvm'

" Support for all things Rust
Plug 'rust-lang/rust.vim'

" Other Rust tools
Plug 'simrat39/rust-tools.nvim'

" Git support
Plug 'tpope/vim-fugitive'

" Remove background colours in transparent terminals
Plug 'tribela/vim-transparent'

" dhcpd.conf 
Plug 'vim-scripts/dhcpd.vim'

function! UpdateRemotePlugins(...)
  " Needed to refresh runtime files
  let &rtp=&rtp
  UpdateRemotePlugins
endfunction

call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	PlugInstall --sync
endif
