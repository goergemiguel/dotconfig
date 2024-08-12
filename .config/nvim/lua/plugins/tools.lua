return {
	{
		"L3MON4D3/LuaSnip", -- snippet engine
		lazy = true,
		event = "InsertEnter",
		config = function()
			-- load vs-code like snippets from plugins (e.g. friendly-snippets)
			require("luasnip/loaders/from_vscode").lazy_load()
			vim.opt.completeopt = "menu,menuone,noselect"
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = true,
		event = "BufRead",
		config = function()
			require("harpoon").setup({
				menu = {
					width = 100,
				},
			})
			local keymap = vim.keymap
			keymap.set("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>") -- Harpoon Marks, show list of harpooned marks
			keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>") -- Harpoon Add, add to list of harpooned
		end,
	},
	{
		"Exafunction/codeium.vim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			vim.g.codeium_idle_delay = 75
			vim.keymap.set("i", "<Tab>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		event = "BufRead",
		opts = {},
	},
	{
		"svban/YankAssassin.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("YankAssassin").setup({
				auto_normal = true, -- if true, autocmds are used. Whenever y is used in normal mode, the cursor doesn't move to start
				auto_visual = true, -- if true, autocmds are used. Whenever y is used in visual mode, the cursor doesn't move to start
			})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown", -- If you decide to lazy-load anyway
		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",

			"nvim-tree/nvim-web-devicons",
		},
	},
}
