return {
	itemgroup = "FZF",
	description = "Fuzzy find everything...",
	icon = "🐱",
	keymaps = {
		{
			"<leader>zf",
			function()
				require("fzf-lua").files()
			end,
			description = "Search for files",
			mode = { "n", "v" },
		},
	},
}
