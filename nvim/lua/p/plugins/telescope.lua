local Util = require 'p.utils'

return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    keys = {
      { '<C-p>', Util.telescope 'files', desc = 'Find Files' },
      { '<leader>,', Util.telescope 'live_grep', desc = 'Find Files' },
      { '<leader>fb', Util.telescope 'buffers', desc = 'Find buffers' },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { 'node_modules', '.git', '.next', '%.png', '%.jpg', 'dist' },
        layout_config = {
          horizontal = { mirror = false },
          vertical = { mirror = false },
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        prompt_prefix = ' 🔍 ',
        mappings = {
          i = {
            ['<c-t>'] = function(...)
              return require('trouble.providers.telescope').open_with_trouble(...)
            end,
            ['<a-t>'] = function(...)
              return require('trouble.providers.telescope').open_selected_with_trouble(...)
            end,
            ['<a-i>'] = function()
              Util.telescope('find_files', { no_ignore = true })()
            end,
            ['<a-h>'] = function()
              Util.telescope('find_files', { hidden = true })()
            end,
            ['<C-Down>'] = function(...)
              return require('telescope.actions').cycle_history_next(...)
            end,
            ['<C-Up>'] = function(...)
              return require('telescope.actions').cycle_history_prev(...)
            end,
            ['<C-f>'] = function(...)
              return require('telescope.actions').preview_scrolling_down(...)
            end,
            ['<C-b>'] = function(...)
              return require('telescope.actions').preview_scrolling_up(...)
            end,
          },
          n = {
            ['q'] = function(...)
              return require('telescope.actions').close(...)
            end,
          },
        },
      },
    },
  },
}
