local config = vim.fn.stdpath("config")
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"

vim.cmd.source(config .. "/plug.vim")
vim.cmd.source(config .. "/visual.vim")
vim.cmd.source(config .. "/vimrc.vim")

-- Set up Git status symbols
require('gitsigns').setup()

-- Set up Mason (LSP plugin manager)
require("mason").setup()
require("mason-lspconfig").setup()

-- Set up tree view
require("nvim-tree").setup()

-- Set up Rust tools
require("rust-tools").setup()

-- Telescope key bindings
local telescope_builtins = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope_builtins.git_files, {})
vim.keymap.set('n', '<leader>o', telescope_builtins.find_files, {})
vim.keymap.set('n', '<leader>g', telescope_builtins.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope_builtins.buffers, {})
vim.keymap.set('n', '<leader>h', telescope_builtins.help_tags, {})

-- Enable Telescope + CoC
require('telescope').load_extension('coc')
vim.keymap.set('n', '<leader>c', '<cmd>Telescope coc workspace_symbols<cr>', {})

-- Enable trouble.vim
require("trouble").setup()

-- Allow moving Telescope queries to the Trouble window
local actions = require("telescope.actions")
local trouble_t = require("trouble.providers.telescope")

require('telescope').setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble_t.open_with_trouble },
      n = { ["<c-t>"] = trouble_t.open_with_trouble },
    },
  },
}
