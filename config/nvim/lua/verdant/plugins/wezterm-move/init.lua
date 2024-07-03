return {
	"letieu/wezterm-move.nvim",
	key = {
		{
			"<C-;>",
			function()
				require("wezterm-move").move("j")
			end,
		},
	},
}
