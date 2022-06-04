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
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp' 
  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' 
  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' 
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip' 
  -- Git plugins
  use 'airblade/vim-gitgutter'
  use 'sindrets/diffview.nvim'
  -- Tree sitter 
  -- TODO
  -- See: https://alpha2phi.medium.com/neovim-tips-for-a-better-coding-experience-3d0f782f034e
  use 'nvim-treesitter/nvim-treesitter'
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
  -- Scrolling
  -- TODO
  -- Code Run
  use 'CRAG666/code_runner.nvim'
end)
