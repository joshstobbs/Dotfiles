return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/nvim-nio",
		"V13Axel/neotest-pest",
	},
	config = function()
		require("neotest").setup({
			log_level = vim.log.levels.DEBUG,
			adapters = {
				require("neotest-pest")({
					sail_enabled = function()
						return false
					end,
				}),
			},
		})
	end,
}
