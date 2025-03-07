local config = vim.fn.stdpath("config")
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"

vim.cmd.source(config .. "/plug.vim")
vim.cmd.source(config .. "/visual.vim")
vim.cmd.source(config .. "/vimrc.vim")

-- Set up code completion via LSP
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler
    require('lspconfig')[server_name].setup {}
  end,
}

-- Set up RGB colourization
require('colorizer').setup()

-- Set up Git status symbols
require('gitsigns').setup()

-- Set up outlining
require('outline').setup()

-- Set up tree view
require("nvim-tree").setup()

-- Set up debugging UI
require("dapui").setup({
  layouts = {
    {
      position = "left",
      size = 40,
      elements = {
        { id = "stacks",      size = 0.2 },
        { id = "scopes",      size = 0.6 },
        { id = "watches",     size = 0.1 },
        { id = "breakpoints", size = 0.1 },
      },
    },
    {
      position = "bottom",
      size = 10,
      elements = {
        { id = "console", size = 0.5 },
        { id = "repl",    size = 0.5 },
      },
    },
  },
})

-- Set up Python debugging
require("dap-python").setup("uv")
require("nvim-dap-virtual-text").setup({
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  show_stop_reason = true,
  commented = true,
  all_frames = true,
})

-- Set up Rust tools
require("rust-tools").setup()

-- Telescope key bindings
local telescope_builtins = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function()
  telescope_builtins.git_files({recurse_submodules = true})
end)
vim.keymap.set('n', '<leader>o', telescope_builtins.find_files, {})
vim.keymap.set('n', '<leader>g', telescope_builtins.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope_builtins.buffers, {})
vim.keymap.set('n', '<leader>h', telescope_builtins.help_tags, {})

-- Enable trouble.vim
require("trouble").setup()

-- Allow moving Telescope queries to the Trouble window
local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    pickers = {
      git_files = { recurse_submodules = true },
    },
  },
}
