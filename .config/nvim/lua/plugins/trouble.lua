return {
	"folke/trouble.nvim",
	lazy = true,
	event = "BufRead",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
	end,
}
