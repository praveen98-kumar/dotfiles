local opt = vim.opt
local indent = 2

vim.g.mapleader = ' '

vim.wo.nu = true
vim.wo.relativenumber = true

opt.backspace = 'indent,eol,start'

opt.expandtab = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.scrolloff = 10
opt.ai = true
opt.si = true
opt.breakindent = true
opt.showtabline = 2

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.inccommand = 'split'
opt.errorbells = false
-- opt.title = true
opt.completeopt = 'menu,menuone,noinsert,noselect'
opt.clipboard = 'unnamed,unnamedplus'

opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.lazyredraw = true
opt.wildignore:append { '*/node_modules/*' }
opt.wrap = false

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.mouse = 'a'

opt.cursorline = true
opt.termguicolors = true
opt.background = 'dark'
opt.cmdheight = 0
--opt.signcolumn    = "yes"
opt.laststatus = 3
opt.winblend = 0
opt.pumblend = 5
opt.wildoptions = 'pum'

opt.formatoptions:append { 'r' }

opt.fillchars = { eob = ' ' }
