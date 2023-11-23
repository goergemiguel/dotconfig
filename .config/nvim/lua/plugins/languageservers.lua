return {

	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	lazy = true,
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		-- set floating windows position based on cursor position
	-- 		local cfg = {
	-- 			floating_window_off_x = 5, -- adjust float windows x position.
	-- 			floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
	-- 				local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
	-- 				local pumheight = vim.o.pumheight
	-- 				local winline = vim.fn.winline() -- line number in the window
	-- 				local winheight = vim.fn.winheight(0)
	--
	-- 				-- window top
	-- 				if winline - 1 < pumheight then
	-- 					return pumheight
	-- 				end
	--
	-- 				-- window bottom
	-- 				if winheight - winline < pumheight then
	-- 					return -pumheight
	-- 				end
	-- 				return 0
	-- 			end,
	-- 		}
	-- 		require("lsp_signature").setup(cfg)
	-- 	end,
	-- },

	{
		"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
		lazy = true,
		event = "BufRead",
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
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
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
			-- LSP configs
			---
			local lspconfig = require("lspconfig")

			-- configure html server
			lspconfig["html"].setup({})

			-- lspconfig["tsserver"].setup({
			-- 	on_attach = on_attach,
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			-- 	cmd = { "typescript-language-server", "--stdio" },
			-- 	capabilities = capabilities,
			-- 	root_dir = util.root_pattern(".git"),
			-- })

			-- configure css server
			lspconfig["cssls"].setup({})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({})

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
