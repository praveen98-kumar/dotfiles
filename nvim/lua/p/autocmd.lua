local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup('HighlightYank', {})

autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 50,
    }
  end,
})
