return {
	{
		-- managing & installing lsp servers, linters & formatters
		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
		config = function()
			-- enable mason
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
		config = function()
			require("mason-lspconfig").setup({
				-- list of servers for mason to install
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"volar",
					"eslint",
					"svelte",
					"gopls",
					"rust_analyzer",
					"csharp_ls",
				},
			})
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("lspsaga").setup({
				-- keybinds for navigation in lspsaga window
				scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
				-- use enter to open file with definition preview
				definition = {
					edit = "<CR>",
				},
				ui = {
					colors = {
						normal_bg = "#022746",
					},
				},
			})
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			-- set floating windows position based on cursor position
			local cfg = {
				floating_window_off_x = 5, -- adjust float windows x position.
				floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
					local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
					local pumheight = vim.o.pumheight
					local winline = vim.fn.winline() -- line number in the window
					local winheight = vim.fn.winheight(0)

					-- window top
					if winline - 1 < pumheight then
						return pumheight
					end

					-- window bottom
					if winheight - winline < pumheight then
						return -pumheight
					end
					return 0
				end,
			}
			require("lsp_signature").setup(cfg)
		end,
	},

	{
		"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
		lazy = true,
		event = "BufRead",
		config = function() end,
	},

	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	{
		"neovim/nvim-lspconfig", -- easily configure language servers,
		config = function()
			local lspconfig = require("lspconfig")
			local keymap = vim.keymap -- for conciseness
			local util = require("lspconfig/util")

			-- enable keybinds only for when lsp server available
			local on_attach = function(client, bufnr)
				-- keybind options
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- set keybinds
				keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
				keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
				keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
				keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
				keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
			end

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- Available language servers

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- lspconfig["tsserver"].setup({
			-- 	on_attach = on_attach,
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			-- 	cmd = { "typescript-language-server", "--stdio" },
			-- 	capabilities = capabilities,
			-- 	root_dir = util.root_pattern(".git"),
			-- })

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
					"vue",
				},
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- configure volar language server
			lspconfig["volar"].setup({
				-- init_options = {
				-- 	typescript = {
				-- 		tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
				-- 	},
				-- },
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }, -- using takeover mode
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = util.root_pattern(".git"),
			})

			lspconfig["eslint"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["gopls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["svelte"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "svelte" },
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			lspconfig["csharp_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
