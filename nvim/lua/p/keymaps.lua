local Util = require 'p.utils'

-- Remove Search Highlight
map('n', '<ESC>', ':noh<CR>', { desc = 'Remove Highlight' })
-- Insert mode to normal mode
map('i', 'jk', '<ESC>', { desc = 'Better Escape' })
-- Save file/buffer
map({ 'i', 'v', 'n', 'x' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- Navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })

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
map('n', '<C-d>', '<C-d>zz', { desc = 'Jump Down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Jump Up' })

-- Select all
map('n', '<C-a>', 'ggVG', { desc = 'Select All Content' })

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

-- Better Indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move block/lines
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move Down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move Up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Up' })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move Up' })

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
