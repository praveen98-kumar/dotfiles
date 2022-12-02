local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

local ok2, masonLspConfig = pcall(require, 'mason-lspconfig')
if not ok2 then
  return
end

local tools = {
  'prettierd',
  'stylua',
  'eslint_d',
}

local function install_tools()
  local mr = require 'mason-registry'
  for _, tool in ipairs(tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

mason.setup {
  ui = {
    icons = {
      package_pending = ' ',
      package_installed = ' ',
      package_uninstalled = ' ﮊ',
    },
  },
}
install_tools()
masonLspConfig.setup {
  ensure_installed = { 'sumneko_lua', 'tsserver' },
  automatic_installation = true,
}
local ok3, lspConfig = pcall(require, 'lspconfig')

if not ok3 then
  return
end
local root_pattern = lspConfig.util.root_pattern

local diagnosticSigns = require('p.icons').diagnostics

local border = {
  { '╭', 'FloatBoader' },
  { '─', 'FloatBoader' },
  { '╮', 'FloatBoader' },
  { '│', 'FloatBoader' },
  { '╯', 'FloatBoader' },
  { '─', 'FloatBoader' },
  { '╰', 'FloatBoader' },
  { '│', 'FloatBoader' },
}

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border, bg = nil }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border, bg = nil }),
}

local on_attach = function(client, bufnr)
  map('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  map('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  map('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  map('n', 'gr', vim.lsp.buf.references, { buffer = bufnr })
  map('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  map('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr })
  map('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr })
  map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  map('n', '<leader>f', vim.lsp.buf.format, { buffer = bufnr })

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities,
}

local servers = {
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
      },
    },
  },
  tsserver = {},
  gopls = {},
  tailwindcss = {
    root_dir = root_pattern(
      'tailwind.config.js',
      'tailwind.config.ts',
      'postcss.config.js',
      'postcss.config.ts',
      'tailwind.config.cjs'
    ),
  },
  emmet_ls = {
    filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
  },
  jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    init_options = {
      provideFormatter = true,
    },
  },
}

for server, opts in pairs(servers) do
  opts = vim.tbl_deep_extend('force', {}, options, opts or {})
  lspConfig[server].setup(opts)
end

for type, icon in pairs(diagnosticSigns) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = '●' },
  severity_sort = true,
})

vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
}
