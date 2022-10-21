local ok, telescope = pcall(require, 'telescope')

if (not ok) then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git/', '.next', '%.png', '%.jpg' },
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
      prompt_position = 'top'
    },
    sorting_strategy = "ascending",
    prompt_prefix = ' 🔍 ',
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd("normal vbd") end
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

map('n', '<C-p>', function()
  builtin.find_files { no_ignore = true, hidden = false }
end)
map("n", ";r", function()
  builtin.live_grep()
end)
map('n', "\\\\", function()
  builtin.buffers()
end)
map("n", ";e", function()
  builtin.diagnostics()
end)
map("n", ";t", function()
  builtin.help_tags()
end)
map("n", ";;", function()
  builtin.resume()
end)
map("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
