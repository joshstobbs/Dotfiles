return {
	itemgroup = "Neotest",
	description = "Run tests within Neovim",
	icon = "🧪",
	keymaps = {
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			description = "Run the nearest test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			description = "Run the current test file",
		},
	},
}
