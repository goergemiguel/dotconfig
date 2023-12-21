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
}
