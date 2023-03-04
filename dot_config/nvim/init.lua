
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
vim.g.vimtex_view_method = 'zathura'
require 'nvim-treesitter.configs'.setup {
    highlight = {
     enable = true,
     disable = { "latex" },
    },
}
vim.cmd[[set conceallevel=2]]

vim.g.vimtex_syntax_nospell_comments=1
vim.cmd[[hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f]]

-- LuaSnip
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnippets/"})
-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
require("luasnip").config.set_config({ -- Setting LuaSnip config

--   -- Enable autotriggered snippets
  enable_autosnippets = true,

--   -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

-- "for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<PageUp>', '<PageDown>']
-- "  exec 'noremap' key '<Nop>'
-- "  exec 'inoremap' key '<Nop>'
-- "  exec 'cnoremap' key '<Nop>'
-- "endfor
