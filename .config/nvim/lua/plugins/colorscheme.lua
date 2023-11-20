return {
	"rebelot/kanagawa.nvim", -- preferred colorscheme
	config = function()
		require("kanagawa").setup({
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
