return {
	{
		"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
		lazy = true,
		event = "InsertEnter",
		config = function() end,
	},

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "BufEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			---
			-- LSP setup
			---
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
				},
				ensure_installed = {
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

			---
			-- Autocompletion config
			---
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Navigate between snippet placeholder
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
			})

			---
			-- Diagnositcs
			---

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			---
			-- LSP configs
			---
			local lspconfig = require("lspconfig")

			-- configure html server
			lspconfig["html"].setup({})

			-- configure css server
			lspconfig["cssls"].setup({})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "require" },
						},
					},
				},
			})

			-- configure volar language server
			lspconfig["volar"].setup({
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }, -- using takeover mode
			})

			lspconfig["eslint"].setup({})

			lspconfig["gopls"].setup({})

			lspconfig["svelte"].setup({
				filetypes = { "svelte" },
			})

			lspconfig["rust_analyzer"].setup({})

			lspconfig["csharp_ls"].setup({})
		end,
	},
}
