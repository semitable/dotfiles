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
        { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
	"folke/tokyonight.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	-- stuff for languages I use:
	-- python:
	{
		"psf/black",
		branch = "stable",
	},
	"brentyi/isort.vim",
	-- snipets:
	{
		"L3MON4D3/luasnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-omni",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "omni" },
				}),
				-- formatting = {
				--   format = function(_, item)
				--     local icons = require("lazyvim.config").icons.kinds
				--     if icons[item.kind] then
				--       item.kind = icons[item.kind] .. item.kind
				--     end
				--     return item
				--   end,
				-- },
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},
	-- "rafamadriz/friendly-snippets",
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		},
		opts = {
			options = {
				separator_style = "slope",
				always_show_bufferline = false,
			},
		},
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
        {
            'goolord/alpha-nvim',
            config = function()
			require'alpha'.setup(require'alpha.themes.startify'.config)
	    end,
        },
	-- LaTeX:
	"lervag/vimtex",

	-- VimWiki:
        {
            "vimwiki/vimwiki",
            event = "BufEnter *.md",
            keys = { "<leader>ww", "<leader>wt" },
            init = function()
                vim.g.vimwiki_folding = ""
                vim.g.vimwiki_list = {
                    {
                        path = "~/vimwiki/",
                        syntax = "markdown",
                        ext = ".md",
                        auto_diary_index = 1,
                    },
                }
                vim.g.vimwiki_global_ext = 0
            end,
        }, 
        "tools-life/taskwiki",
	-- beancount:
	-- 'nathangrigg/vim-beancount',

	-- general plugins:
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",

	-- lightspeed for fast moving in files
	"ggandor/lightspeed.nvim",

	-- telescope config:
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
}

require("lazy").setup(plugins)
