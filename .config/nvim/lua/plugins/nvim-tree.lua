return {
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	cmd = "NvimTreeToggle",
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		require("nvim-tree").setup({
			-- change folder arrow icons
			renderer = {
				icons = {
					show = {
						folder_arrow = false,
					},
				},
				indent_width = 3,
			},
			view = {
				side = "right",
				width = 50,
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
}
