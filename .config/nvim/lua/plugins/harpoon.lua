return {
	"ThePrimeagen/harpoon",
	lazy = true,
	event = "BufRead",
	config = function()
		require("harpoon").setup({
			menu = {
				width = 100,
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>") -- Harpoon Marks, show list of harpooned marks
		keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>") -- Harpoon Add, add to list of harpooned
	end,
}
