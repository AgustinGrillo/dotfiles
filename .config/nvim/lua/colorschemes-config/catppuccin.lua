local catppuccin = require("catppuccin")

-- configure it (info at --> https://github.com/catppuccin/nvim)
-- catppuccin.setup(<settings>)

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
