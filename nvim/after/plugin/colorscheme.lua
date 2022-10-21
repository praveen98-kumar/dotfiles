local ok, tokyonight = pcall(require, 'tokyonight')

if not ok then
  return
end

tokyonight.setup {
  style = 'night',
  on_highlights = function(hl, c)
    hl.CursorLineNr = {
      fg = '#ff8000',
      bold = true,
      bg = c.bg_dark,
    }
    hl.NormalFloat = {
      bg = 'NONE',
    }
    hl.FloatBorder = {
      bg = 'NONE',
    }
  end,
}

vim.cmd [[colorscheme tokyonight]]
