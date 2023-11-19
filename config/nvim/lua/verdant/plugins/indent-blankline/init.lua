return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	priority = 9999,
	config = function()
		require("ibl").setup({
			indent = {
				tab_char = "▎",
			},
			exclude = {
				filetypes = {
					"help",
					"terminal",
					"dashboard",
					"packer",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
				},
				buftypes = {
					"terminal",
					"NvimTree",
				},
			},
			scope = { enabled = false },
		})
	end,
}
