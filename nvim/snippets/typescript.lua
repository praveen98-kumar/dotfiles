---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: unused-local
local snippets, autosnippets = {}, {}
local luasnip_utils = require 'p.utils.snip'
local cs = luasnip_utils.create_snippet
local tsn = luasnip_utils.tsn
local pattern = '*.ts'

return snippets, autosnippets
