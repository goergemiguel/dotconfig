return {
	"numToStr/Comment.nvim",
	lazy = true,
	event = "CursorMoved",
	config = function()
		require("Comment").setup()
	end,
}
