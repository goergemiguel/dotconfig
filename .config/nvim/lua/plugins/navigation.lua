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
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
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
	{
		"hedyhli/outline.nvim",
		config = function()
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
			require("outline").setup({
				opts = {
					focus_outline = true,
				},
			})
		end,
		lazy = true,
		event = "BufRead",
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = true,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			{ "<c-v>", "<C-w>v" },
			{ "<c-s>", "<C-w>s" },
		},
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		config = function()
			require("hop").setup({
				keys = "etovxqpdygfblzhckisuran",
			})
			local hop = require("hop")
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, { remap = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, { remap = true })
			vim.keymap.set("n", "sh", "<cmd>HopWord<CR>", { silent = true })
			vim.keymap.set("n", "sv", "v<cmd>HopLine<CR>", { silent = true })
		end,
	},
}
