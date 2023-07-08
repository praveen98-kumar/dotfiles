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

-- show cursor line only in active window
local cursorline_group = augroup('CursorLine', { clear = true })
autocmd({ 'InsertLeave', 'WinEnter' }, {
  group = cursorline_group,
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, 'auto-cursorline')
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, 'auto-cursorline')
    end
  end,
})
autocmd({ 'InsertEnter', 'WinLeave' }, {
  group = cursorline_group,
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, 'auto-cursorline', cl)
      vim.wo.cursorline = false
    end
  end,
})

local update_group = augroup('UpdateVim', { clear = true })
autocmd('VimResized', {
  group = update_group,
  pattern = '*',
  command = 'wincmd =',
})
