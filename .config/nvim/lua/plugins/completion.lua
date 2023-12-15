return {
	{ "hrsh7th/cmp-buffer", lazy = true, event = "BufRead" }, -- source for text in buffer
	{
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		lazy = true,
		event = "BufRead",
	},
	{ "hrsh7th/cmp-path", lazy = true, event = "BufRead" }, -- source for file system paths
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		lazy = true,
		event = "BufRead",
	},
	{
		"hrsh7th/cmp-nvim-lsp", -- for autocompletion"
		lazy = true,
		event = "BufRead",
	},
	{
		"hrsh7th/nvim-cmp", -- completion plugin
		lazy = true,
		event = "BufRead",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
					{ name = "nvim_lsp_signature_help" }, -- function signature helper
					{ name = "codeium" },
				}),
				-- configure lspkind for vs-code like icons
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = { Codeium = "" },
					}),
				},
			})
		end,
	},
}
