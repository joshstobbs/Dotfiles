return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"pmizio/typescript-tools.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
			lsp_zero.set_sign_icons({
				error = "",
				warn = "󱨊",
				hint = "",
				info = "",
			})
		end)

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		require("luasnip.loaders.from_snipmate").lazy_load()

		cmp.setup({
			preselect = "item",
			sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert({
				-- ["gR"] = "<cmd>lua vim.lsp.buf.rename()<cr>",
				-- ["gh"] = "<cmd>lua vim.lsp.buf.hover()<cr>",

				-- `Enter` key to confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						before = require("tailwind-tools.cmp").lspkind_format,
						mode = "symbol_text",
						maxwidth = 50,
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { triempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "     (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"astro",
				"cssls",
				"html",
				"intelephense",
				"jsonls",
				"lua_ls",
				"svelte",
				"tailwindcss",
				"tsserver",
				"volar",
			},
			handlers = {
				lsp_zero.default_setup,
				volar = function()
					require("lspconfig").volar.setup({
						filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
						init_options = {
							vue = {
								hybridMode = false,
							},
							typescript = {
								tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
							},
						},
					})
				end,
				tailwindcss = function()
					require("lspconfig").tailwindcss.setup({
						settings = {
							tailwindCSS = {
								experimental = {
									classRegex = {
										{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
										{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
										{ "tv\\((([^()]*|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
									},
								},
							},
						},
					})
				end,
			},
		})

		require("typescript-tools").setup({})
	end,
}
