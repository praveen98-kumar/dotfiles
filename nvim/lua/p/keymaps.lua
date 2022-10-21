-- Remove Search Highlight
map('n', '<ESC>', ':noh<CR>')
-- Insert mode to normal mode
map('i', 'jk', '<ESC>')
-- Save file/buffer
map('i', '<C-s>', '<ESC>:w!<CR>')
map('n', '<C-s>', ':w!<CR>')

-- Navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

-- Do not yank with x
map('n', 'x', '"_x')

-- Increment/Decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Delete a word backword
map('n', 'dw', 'vd"_d')

map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')

map('v', '<leader>p', '"_dP')

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')

-- Large verticle jump
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Select all
map('n', '<C-a>', 'ggVG')

-- Switch splits
map('n', '<Space>', '<C-w>w')

-- LSP
map('n', 'ge', function()
  vim.diagnostic.open_float { border = 'rounded' }
end)
map('n', '[d', function()
  vim.diagnostic.goto_prev { float = { border = 'rounded' } }
end)
map('n', ']d', function()
  vim.diagnostic.goto_next { float = { border = 'rounded' } }
end)

-- Indents
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move block/lines
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')

-- local timer = vim.loop.new_timer()
-- local function blink()
--   local cnt, blink_times = 0, 8
--   timer:start(
--     0,
--     100,
--     vim.schedule_wrap(function()
--       vim.cmd 'set cursorcolumn! cursorline!'
--       cnt = cnt + 1
--       if cnt == blink_times then
--         timer:stop()
--       end
--     end)
--   )
-- end
--
-- map('n', '<leader>cb', blink)
