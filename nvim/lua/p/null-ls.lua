local ok, nls = pcall(require, 'null-ls')

if not ok then
  return
end

local lsp_formatting = function(client)
  if client.name == 'null-ls' then
    vim.lsp.buf.format()
  end
end

local lsp_format_group = vim.api.nvim_create_augroup('LspFormatting', {})

nls.setup {
  sources = {
    nls.builtins.formatting.stylua,
    nls.builtins.formatting.prettierd,
    nls.builtins.formatting.eslint_d.with {
      filter = function(diagnostic)
        return diagnostic.code ~= 'prettier/prettier'
      end,
      condition = function(utils)
        return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yml', '.eslintrc.cjs' }
      end,
    },
    nls.builtins.code_actions.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yml' }
      end,
    },
  },

  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = lsp_format_group, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = lsp_format_group,
        buffer = bufnr,
        callback = function()
          lsp_formatting(client)
        end,
      })
    end
  end,
}
