local namespace = {}

---@param mode string | table
---@param lhs string
---@param rhs string | function
---@param options table | nil
local function map(mode, lhs, rhs, options)
  options = vim.tbl_deep_extend('force', { noremap = true, silent = true }, options or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

_G.pk = pk or namespace
_G.map = map
_G.P = vim.print

require 'p'
