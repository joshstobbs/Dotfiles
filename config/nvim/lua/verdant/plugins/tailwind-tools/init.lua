return {
	"luckasRanarison/tailwind-tools.nvim",
	event = "VeryLazy",
	config = function()
		require("tailwind-tools").setup({})
	end,
}
