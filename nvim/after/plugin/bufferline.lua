local ok, bufferline = pcall(require, 'bufferline')

if (not ok) then
  return
end

bufferline.setup {}

map('n', '<TAB>', '<CMD>BufferLineCycleNext<CR>')
map('n', '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>')
