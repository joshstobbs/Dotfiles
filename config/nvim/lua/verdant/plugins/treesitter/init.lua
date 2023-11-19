return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {
				custom_calculation = function(node, language_tree)
					if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" then
						return "{{-- %s --}}"
					end
				end,
			},
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"arduino",
				"bash",
				"comment",
				"css",
				"diff",
				"dockerfile",
				"elixir",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"http",
				"ini",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"make",
				"markdown",
				"passwd",
				"php",
				"phpdoc",
				"python",
				"regex",
				"ruby",
				"rust",
				"sql",
				"svelte",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "yaml" } },
			context_commentstring = { enable = true },
			autotag = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["if"] = "@function.inner",
						["af"] = "@function.outer",
						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",
					},
				},
			},
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})
	end,
}
