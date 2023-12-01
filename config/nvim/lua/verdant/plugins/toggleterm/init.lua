return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			open_mapping = "<leader>\\",
			insert_mappings = false,
			terminal_mappings = true,
			shade_terminals = false,
		})
	end,
}
