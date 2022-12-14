local ok, onedark = pcall(require, 'onedark')

if not ok then
  return
end

onedark.setup {
  style = 'deep',
  lualine = {
    transparent = true,
  },
  --   on_highlights = function(hl, c)
  --     hl.CursorLineNr = {
  --       fg = '#ff8000',
  --       bold = true,
  --       bg = c.bg_dark,
  --     }
  --     hl.NormalFloat = {
  --       bg = 'NONE',
  --     }
  --     hl.FloatBorder = {
  --       bg = 'NONE',
  --     }
  --   end,
}
--
vim.cmd [[colorscheme onedark]]
