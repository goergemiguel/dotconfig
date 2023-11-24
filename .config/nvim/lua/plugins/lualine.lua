return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		-- Color table for highlights
		-- stylua: ignore
		local colors = {
  			bg       = '#202328',
  			fg       = '#bbc2cf',
  			yellow   = '#ECBE7B',
  			cyan     = '#008080',
  			darkblue = '#081633',
  			green    = '#98be65',
  			orange   = '#FF8800',
  			violet   = '#a9a1e1',
  			magenta  = '#c678dd',
  			blue     = '#51afef',
  			red      = '#ec5f67',
}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			function()
				return "⏺"
			end,
			cond = conditions.buffer_not_empty,
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.green,
					i = colors.magenta,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.red,
					no = colors.green,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.green,
					ce = colors.green,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.green,
					t = colors.green,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { left = 1 }, -- We don't need space before this
		})

		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.white, gui = "bold" },
		})

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_right({ "filetype" })
		ins_right({ "location" })
		ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

		-- Now don't forget to initialize lualine
		lualine.setup(config)
	end,
	lazy = true,
	event = "BufRead",
}
