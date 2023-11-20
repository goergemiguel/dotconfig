return {
	"L3MON4D3/LuaSnip", -- snippet engine
	lazy = true,
	event = "InsertEnter",
	config = function()
		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip/loaders/from_vscode").lazy_load()
		vim.opt.completeopt = "menu,menuone,noselect"
	end,
}
