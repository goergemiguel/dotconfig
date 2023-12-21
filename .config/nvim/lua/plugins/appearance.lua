return {
	{
		"rebelot/kanagawa.nvim", -- preferred colorscheme
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd("colorscheme kanagawa-wave")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
		lazy = true,
		event = "BufRead",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "BufRead",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"petertriho/nvim-scrollbar",
		lazy = true,
		event = "BufRead",
		config = function()
			require("scrollbar").setup({
				handlers = {
					gitsigns = true, -- Requires gitsigns
				},
			})
		end,
	},
	{
		"szw/vim-maximizer", -- maximizes and restores current window
		lazy = true,
		cmd = "MaximizerToggle",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			-- Bubbles config for lualine
			-- Author: lokesh-krishna
			-- MIT license, see LICENSE for more details.

			local colors = {
				cyan = "#79dac8",
				black = "#080808",
				white = "#c6c6c6",
				green = "#91F5AD",
				grey = "#303030",
				pink = "#8B1E3F",
				orange = "#DB4C40",
				yellow = "#E9B44C",
			}

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.green },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.black, bg = colors.black },
				},

				insert = { a = { fg = colors.black, bg = colors.yellow } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.white, bg = colors.pink } },
				command = { a = { fg = colors.black, bg = colors.orange } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.black, bg = colors.black },
				},
			}

			require("lualine").setup({
				options = {
					theme = bubbles_theme,
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "branch", separator = { left = "" }, right_padding = 2, gui = "bold" },
					},
					lualine_b = { "filename", "diagnostics" },
					lualine_c = { "fileformat" },
					lualine_x = {},
					lualine_y = { "filetype", "progress", "location" },
					lualine_z = {
						{ "mode", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = {},
			})
		end,
		lazy = true,
		event = "BufRead",
	},
}
