return {
	"kylechui/nvim-surround",
	lazy = true,
	event = "BufRead",
	config = function()
		require("nvim-surround").setup()
	end,
}
