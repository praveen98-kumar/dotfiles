return {
  -- lsp server
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { 'markdown' },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require 'lspconfig.server_configurations.tailwindcss'
          ---@param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
  },

  -- color swatches
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- update completion options
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
    },
    opts = function(_, opts)
      opts.formatting = {
        format = require('tailwindcss-colorizer-cmp').formatter,
      }
    end,
  },
}
