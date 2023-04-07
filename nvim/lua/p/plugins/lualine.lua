return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'tokyonight',
        globalstatus = true,
      },
    },
    config = function(_, opts)
      require('lualine').setup(opts)
    end,
  },
}
