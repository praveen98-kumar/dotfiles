local M = {}
local constants = {
  HL_END = '%*',
  ALIGN = '%=',
  END = '%<',
  CLICK_END = '%X',
}

local function is_get_repo()
  local is_repo = vim.fn.isdirectory(vim.fn.getcwd() .. '/' .. '.git') > 0
  return is_repo and 'repo' or 'no'
end

local color = require 'p.palette'
vim.o.statusline = '%f' .. is_get_repo()

return M
