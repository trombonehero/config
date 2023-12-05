" A nice, warm colour scheme
colorscheme gruvbox

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
	autocmd VimEnter * set guifont=Hack:h12.5
end

" Set up status line
autocmd VimEnter * lua require("lualine").setup()
