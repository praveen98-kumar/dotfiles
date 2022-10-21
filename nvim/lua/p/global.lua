_G.map = function(mode, lhs, rhs, options)
  options = vim.tbl_deep_extend('force', { noremap = true, silent = true }, options or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

local function fold(callback, list, accum)
  accum = accum or {}
  for k, v in pairs(list) do
    accum = callback(accum, v, k)
    assert(accum ~= nil, 'The accumulator must be returned on each iteration')
  end
  return accum
end

local function validate_autocmd(name, cmd)
  local keys = { 'event', 'buffer', 'pattern', 'desc', 'command', 'group', 'once', 'nested' }
  local incorrect = fold(function(accum, _, key)
    if not vim.tbl_contains(keys, key) then
      table.insert(accum, key)
    end
    return accum
  end, cmd, {})
  if #incorrect == 0 then
    return
  end
  vim.schedule(function()
    vim.notify('Incorrect keys: ' .. table.concat(incorrect, ', '), 'error', {
      title = string.format('Autocmd: %s', name),
    })
  end)
end

_G.cmdgroup = function(name, commands)
  assert(name ~= 'User', 'The name of an augroup cannot be User')
  assert(#commands > 0, string.format('You must specify at least one command for %s', name))
  local id = vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(commands) do
    validate_autocmd(name, autocmd)
    local is_callback = type(autocmd.command) == 'function'
    vim.api.nvim_create_autocmd(autocmd.event, {
      group = name,
      pattern = autocmd.pattern,
      desc = autocmd.desc,
      callback = is_callback and autocmd.command or nil,
      command = not is_callback and autocmd.command or nil,
      once = autocmd.once,
      nested = autocmd.nested,
      buffer = autocmd.buffer,
    })
  end
  return id
end
