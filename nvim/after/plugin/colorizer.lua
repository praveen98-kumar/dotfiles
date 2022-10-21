local ok, colorizer = pcall(require, 'colorizer')

if not ok then
  return
end

colorizer.setup {
  '*',
  css = { rgb_fn = true, hsl_fn = true, css_fn = true },
}
