return {
	"folke/edgy.nvim",
	-- event = "VeryLazy",
	priority = 9999,
	lazy = false,
	config = function()
		require("edgy").setup({
			animate = {
				enabled = false,
			},
			left = {
				{
					ft = "NvimTree",
					title = "Files",
					size = { height = 0.5, width = 0.2 },
				},
			},
			bottom = {
				-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
				{
					ft = "toggleterm",
					size = { height = 0.4 },
					-- exclude floating windows
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
			},
		})
	end,
}
