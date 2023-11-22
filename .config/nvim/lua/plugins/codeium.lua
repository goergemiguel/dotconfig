return {
	"Exafunction/codeium.vim",
	lazy = true,
	event = "BufEnter",
	config = function()
		vim.g.codeium_idle_delay = 75
	end,
}
