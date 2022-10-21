local M = {}

M.cmp_kind = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

M.diagnostics = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
}

M.border = {
  '╭',
  '─',
  '╮',
  '│',
  '╯',
  '─',
  '╰',
  '│',
}

M.git = {
  add = '', -- '',
  mod = '',
  remove = '', -- '',
  ignore = '',
  rename = '',
  diff = '',
  repo = '',
  logo = '',
  branch = '',
}

return M
