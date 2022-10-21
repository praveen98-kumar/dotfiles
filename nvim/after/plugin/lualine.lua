local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup {
  options = {
    theme = 'tokyonight',
    disabled_filetypes = {
      'toggleterm',
      'NvimTree',
      'vista_kind',
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  extensions = { 'nvim-tree' },
}
