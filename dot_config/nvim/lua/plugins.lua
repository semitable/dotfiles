local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme and statusline
  'folke/tokyonight.nvim',
  {
      'nvim-lualine/lualine.nvim',
       dependencies = { 'kyazdani42/nvim-web-devicons' }
  },
  -- stuff for languages I use:
  -- python:
  {
      'psf/black',
      branch = 'stable'
  },
  'brentyi/isort.vim',
  -- snipets:
  "L3MON4D3/LuaSnip",

  -- LaTeX:
  'lervag/vimtex',

  -- VimWiki:
  'vimwiki/vimwiki',

  -- beancount:
  -- 'nathangrigg/vim-beancount',

  -- general plugins:
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',

  -- lightspeed for fast moving in files
  'ggandor/lightspeed.nvim',

  -- telescope config:
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make' 
  },
  {
      'nvim-treesitter/nvim-treesitter',
      build = function() 
          pcall(require('nvim-treesitter.install').update { with_sync = true }) 
      end,
  },
}

require("lazy").setup(plugins)
