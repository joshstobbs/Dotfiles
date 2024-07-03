return {
	"codethread/qmk.nvim",
	config = function()
		local conf = {
			name = "LAYOUT_tkl",
			layout = {
				"x _ x x x x _ x x x x _ x x x x _ x x x",
				"x x x x x x x x x x x x x xx^ _ x x x _",
				"^xx x x x x x x x x x x x x xx^ _ x x x",
				"^xx x x x x x x x x x x x xx^ _ _ _ _ _",
				"^xx x x x x x x x x x x xx^ _ _ x _ _ _",
				"^xx x x xx^xx x x x _ x x x _ _ _ _ _ _",
			},
		}

		require("qmk").setup(conf)
	end,
}
