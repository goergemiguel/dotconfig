return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", "rustywind" },
				typescript = { "prettier", "rustywind" },
				svelte = { "prettier", "rustywind" },
				vue = { "prettier", "rustywind" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				cs = { "csharpier" },
				graphql = { "graphql", "prettier" },
			},
			formatters = {
				csharpier = {
					command = "dotnet-csharpier",
					args = { "--write-stdout" },
				},
			},
		})
	end,
}
