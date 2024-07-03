return {
	itemgroup = "FZF",
	description = "Fuzzy find everything...",
	icon = "🐱",
	keymaps = {
		{
			"<D-z>",
			function()
				require("fzf-lua").files({
					fd_opts = "--color never --type f --hidden --follow -E=node_modules -E=vendor",
				})
			end,
			description = "Search for files",
			mode = { "n", "v" },
		},
	},
}
