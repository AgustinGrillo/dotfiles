local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- local opt = { expr = true, remap = true }

vim.g.mapleader = ' '

-- Nvim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- Telescope
map('n', '<leader>ff', ':Telescope find_files <CR>', opts)
map('n', '<leader>fw', ':Telescope live_grep <CR>', opts)
map('n', '<leader>fc', ':Telescope grep_string <CR>', opts)
map('n', '<leader>fy', ':Telescope neoclip <CR>', opts)
-- Commenting
-- vim.keymap.set('n', '<C-Bslash>', "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'", opt)
map('n', '<C-Bslash>', "<Plug>(comment_toggle_current_linewise)", opts)
vim.keymap.set('x', '<C-Bslash>', '<Plug>(comment_toggle_blockwise_visual)')


