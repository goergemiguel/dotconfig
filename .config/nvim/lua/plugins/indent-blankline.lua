return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "BufRead",
	main = "ibl",
	config = function()
		require("ibl").setup()
	end,
}
