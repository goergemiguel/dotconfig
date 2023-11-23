return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>tt", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	config = function()
		require("outline").setup({
			outline_window = {
				show_numbers = true,
				show_relative_numbers = true,
			},
		})
	end,
}
