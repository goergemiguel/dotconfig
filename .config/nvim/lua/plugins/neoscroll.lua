return {
	"karb94/neoscroll.nvim",
	lazy = true,
	event = "CursorMoved",
	config = function()
		require("neoscroll").setup()
	end,
}
