return {
	"petertriho/nvim-scrollbar",
	lazy = true,
	event = "BufRead",
	config = function()
		require("scrollbar").setup({
			handlers = {
				gitsigns = true, -- Requires gitsigns
			},
		})
	end,
}
