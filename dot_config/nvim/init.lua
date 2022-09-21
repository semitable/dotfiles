
require "lua/plugins"
require "lua/keymaps"
require "lua/options"

-- Setup colorsceme + status bar
vim.cmd[[colorscheme tokyonight-night]]
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

-- "for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<PageUp>', '<PageDown>']
-- "  exec 'noremap' key '<Nop>'
-- "  exec 'inoremap' key '<Nop>'
-- "  exec 'cnoremap' key '<Nop>'
-- "endfor
