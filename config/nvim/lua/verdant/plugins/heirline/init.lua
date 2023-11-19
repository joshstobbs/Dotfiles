return {
	"rebelot/heirline.nvim",
	config = function()
		local statusline = require("verdant.plugins.heirline.statusline")
		local colors = require("ayu.colors")
		colors.generate(true)

		require("heirline").setup({
			opts = {
				-- colors = colors,
				statusline = statusline,
			},
		})
	end,
}
