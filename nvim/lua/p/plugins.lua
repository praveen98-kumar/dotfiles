local M = {
  -- Plugin Manager
  ['wbthomason/packer.nvim'] = {},
  -- Basic Plugins
  ['nvim-lua/plenary.nvim'] = {},
  ['nvim-lua/popup.nvim'] = {},
  ['nathom/filetype.nvim'] = {},
  ['kyazdani42/nvim-web-devicons'] = {},

  -- Colorscheme
  ['navarasu/onedark.nvim'] = {},
  ['folke/tokyonight.nvim'] = {},

  -- LSP
  ['neovim/nvim-lspconfig'] = {},
  ['williamboman/mason.nvim'] = {},
  ['williamboman/mason-lspconfig.nvim'] = {},

  -- Completion
  ['hrsh7th/cmp-nvim-lsp'] = {},
  ['hrsh7th/cmp-buffer'] = {},
  ['hrsh7th/cmp-path'] = {},
  ['hrsh7th/nvim-cmp'] = {},

  ['jose-elias-alvarez/null-ls.nvim'] = {},

  -- Snippets
  ['L3MON4D3/LuaSnip'] = {},
  ['saadparwaiz1/cmp_luasnip'] = {},

  -- Syntax Highlight
  ['nvim-treesitter/nvim-treesitter'] = {
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
  },

  ['windwp/nvim-autopairs'] = {},
  ['windwp/nvim-ts-autotag'] = {},
  ['norcalli/nvim-colorizer.lua'] = {},
  ['p00f/nvim-ts-rainbow'] = {},

  -- Fuzzy finder
  ['nvim-telescope/telescope.nvim'] = {},
  ['nvim-telescope/telescope-file-browser.nvim'] = {},

  ['akinsho/bufferline.nvim'] = { tag = 'v2.*' },
  ['lewis6991/gitsigns.nvim'] = {},
  ['nvim-lualine/lualine.nvim'] = {},
  ['numToStr/Comment.nvim'] = {},
  ['kyazdani42/nvim-tree.lua'] = { tag = 'nightly' },
}

return M
