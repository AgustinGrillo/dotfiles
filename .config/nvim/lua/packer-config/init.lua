return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Color Scheme
  use "catppuccin/nvim" as = "catppuccin"
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- File Explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Collection of configurations for the built-in LSP client
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp' 
  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'hrsh7th/cmp-buffer' 
  use 'hrsh7th/cmp-path' 
  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' 
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip' 
  -- Highlighting
  use 'RRethy/vim-illuminate'
  -- Git plugins
  use 'airblade/vim-gitgutter'
  use 'sindrets/diffview.nvim'
  use 'kdheepak/lazygit.nvim'
  -- Tree sitter 
 use {
       'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    } 
  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  -- Telescope / FuzzyFinder
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'sharkdp/fd'
  use 'BurntSushi/ripgrep'
  use 'AckslD/nvim-neoclip.lua'
  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    }
  -- Tabline
  use 'romgrk/barbar.nvim'
  -- Code Run and Debug
  use 'CRAG666/code_runner.nvim'
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  -- Github copilot
  -- use "github/copilot.vim"
  -- Scrolling
  use 'karb94/neoscroll.nvim'
  -- vim-surround
  use 'tpope/vim-surround'
  -- Terminal toggler
  use {"akinsho/toggleterm.nvim", tag = 'v1.*'}
  -- Todo's manager
  use 'folke/todo-comments.nvim'
  -- Markdown plugin
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
