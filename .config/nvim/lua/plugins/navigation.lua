return {
	{
		"karb94/neoscroll.nvim",
		lazy = true,
		event = "CursorMoved",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
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
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = function()
			local actions = require("telescope.actions")
			-- configure telescope
			require("telescope").setup({
				-- configure custom mappings
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
					file_ignore_patterns = { "node_modules" },
				},
			})
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
