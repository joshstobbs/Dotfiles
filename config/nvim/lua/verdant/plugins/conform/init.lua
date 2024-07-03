return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "rustywind", "prettierd" },
				javascriptreact = { "rustywind", "prettierd" },
				typescript = { "rustywind", "prettierd" },
				typescriptreact = { "rustywind", "prettierd" },
				lua = { "stylua" },
				php = { "pint" },
				svelte = { "rustywind", "prettierd" },
				vue = { "rustywind", "prettierd" },
			},
			format_on_save = { lsp_fallback = true, timeout_ms = 1000 },
			format_after_save = { lsp_fallback = true, timeout_ms = 1000 },
			notify_on_error = false,
		})
	end,
}
