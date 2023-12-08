return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Bubbles config for lualine
		-- Author: lokesh-krishna
		-- MIT license, see LICENSE for more details.

		local colors = {
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			primary = "#17A398",
			grey = "#303030",
			pink = "#8B1E3F",
			orange = "#DB4C40",
			yellow = "#E9B44C",
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.primary },
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
				lualine_b = { "filename" },
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
}
