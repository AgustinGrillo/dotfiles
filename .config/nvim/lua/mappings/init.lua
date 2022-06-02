local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

-- Nvim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- Telescope
map('n', '<leader>ff', ':Telescope find_files <CR>', opts)
