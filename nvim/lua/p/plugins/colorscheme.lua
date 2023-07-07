return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = 'night',
      transparent = true,
      on_highlights = function(hl, c)
        hl.CursorLineNr = {
          bold = true,
          bg = c.bg_dark,
          fg = c.orange,
        }
      end,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      require('tokyonight').load()
    end,
  },
}
