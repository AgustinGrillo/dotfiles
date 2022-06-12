local servers = { 'pyright', 'clangd', 'sumneko_lua' , 'arduino_language_server' }

-- Lsp installer (Beofre lspconfig setup)
require("nvim-lsp-installer").setup {
    ensure_installed = servers,
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSP diagnostic config
-- Change severity for signs and text.
vim.diagnostic.config({
    underline = {severity = vim.diagnostic.severity.ERROR},
    virtual_text = {severity = {min=vim.diagnostic.severity.ERROR},
        spacing = 4,
        prefix = '●',},
    signs = {severity = {min=vim.diagnostic.severity.WARN}},
})
-- Add floating window to display diagnostics
vim.o.updatetime = 500
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- Change diagnoistic sign (Highlight number instead of icon)
vim.cmd [[
  highlight! DiagnosticLineNrError guibg=SignColumn guifg=#F38BA8 gui=bold
  highlight! DiagnosticLineNrWarn guibg=SignColumn guifg=#F9E2AF gui=bold
  highlight! DiagnosticLineNrInfo guibg=SignColumn guifg=#A6E3A1 gui=bold
  highlight! DiagnosticLineNrHint guibg=SignColumn guifg=#89B4FA gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticLineNrWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

    -- Configure Highlighting
    require 'illuminate'.on_attach(client)
    vim.api.nvim_command('let g:Illuminate_delay = 500')
    vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<a-o>', '<cmd>lua require"illuminate".toggle_pause()<cr>', {noremap=true})
end


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
    if lsp == 'arduino_language_server' then
        require('lspconfig')[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                -- This will be the default in neovim 0.7+
                debounce_text_changes = 150,
            },
            cmd = {
                "arduino-language-server",
                "-cli-config", "/home/agus/.arduino15/arduino-cli.yaml",
                "-fqbn", "esp32:esp32:nodemcu-32s",
                '-cli', '/home/agus/.local/bin/arduino-cli',
                '-clangd', '/usr/bin/clangd',
            }
        }
    elseif lsp == 'clangd' then
        require('lspconfig')[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                -- This will be the default in neovim 0.7+
                debounce_text_changes = 150,
            },
            filetype = {"c", "cpp", "objc", "objcpp", "arduino", "ino"},
        }

    else
        require('lspconfig')[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                -- This will be the default in neovim 0.7+
                debounce_text_changes = 150,
            }
        }
    end
end
