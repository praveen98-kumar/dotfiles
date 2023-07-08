---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: unused-local
local snippets, autosnippets = {}, {}
local luasnip_utils = require 'p.utils.snip'
local cs = luasnip_utils.create_snippet

cs {
  trigger = 'locM',
  nodes = fmt(
    [=[
local M = {{}}
{}
return M
]=],
    {
      i(1, ''),
    }
  ),
  target_table = snippets,
}

-- Create Lua Snippets
local createLuaSnippet_keymaps_fmt = fmt(
  [[
{}target_table = {},
    pattern = {{ {} }},
    keymaps = {{ "{}" }},
  ]],
  {
    i(1, ''),
    c(2, { t 'snippets', t 'autosnippets' }),
    c(3, { i(1, 'pattern'), sn(1, { t '*."', i(1, '"') }) }),
    i(4, ''),
  }
)

local createLuaSnippet_fmt = fmt(
  [[
cs({{
	trigger = "{}",
	nodes = fmt(
    [=[
{}
]=],
    {{
      {}
    }}
  ),
  {}
}})
]],
  {
    i(3, '_trigger'),
    i(1, ''),
    i(2, ''),
    c(4, {
      t 'target_table = snippets',
      t 'target_table = autosnippets',
      createLuaSnippet_keymaps_fmt,
    }),
  }
)

cs {
  trigger = 'createLuaSnippet',
  nodes = createLuaSnippet_fmt,
  target_table = snippets,
  pattern = { '*/snippets/*.lua' },
  keymaps = { '<C-K>c', '<C-J>cs' },
}

return snippets, autosnippets
