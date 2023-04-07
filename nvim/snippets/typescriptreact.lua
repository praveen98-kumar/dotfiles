---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: unused-local
local snippets, autosnippets = {}, {}
local luasnip_utils = require 'p.utils.snip'
local cs = luasnip_utils.create_snippet
local tsn = luasnip_utils.tsn
local pattern = '*.tsx'

cs {
  trigger = 'tsrafce',
  nodes = fmt(
    [=[
import React from "react";

interface {}Props {{
  {}
}}

const {} = ({{}}: {}:Props) => {{
  return (
    <div>{}</div>
  )
}}

export default {};
]=],
    {
      i(1),
      i(2),
      i(1),
      i(3),
      i(1),
      i(1),
    }
  ),
  target_table = snippets,
}

return snippets, autosnippets
