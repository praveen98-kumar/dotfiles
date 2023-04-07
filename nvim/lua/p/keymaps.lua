local Util = require 'p.utils'

local function map(mode, lhs, rhs, options)
  options = vim.tbl_deep_extend('force', { noremap = true, silent = true }, options or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

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

if Util.has 'bufferline.nvim' then
  map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
  map('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
else
  map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
  map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
end

if Util.has 'telescope.nvim' then
  map('n', '<leader>f', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
end
