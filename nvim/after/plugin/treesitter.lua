local ok, ts = pcall(require, 'nvim-treesitter.configs')

if (not ok) then return end

ts.setup({
  ensure_installed = {
    'lua',
    'json',
    'css',
    'html',
    'tsx',
    'typescript',
    'javascript',
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    extened_mode = false,
    max_file_lines = nil
  },
  autotag = {
    enable = true
  }
})
