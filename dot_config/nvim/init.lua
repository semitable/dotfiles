
require "plugins"
require "keymaps"
require "options"

-- Setup colorsceme + status bar
vim.cmd[[colorscheme tokyonight-night]]
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

require('telescope').load_extension('fzf')
-- "for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<PageUp>', '<PageDown>']
-- "  exec 'noremap' key '<Nop>'
-- "  exec 'inoremap' key '<Nop>'
-- "  exec 'cnoremap' key '<Nop>'
-- "endfor
