return {
	itemgroup = "Git",
	description = "Manage Git with Neogit",
	icon = "🚂",
	keymaps = {
		{
			"<leader>n",
			function()
				require("neogit").open()
			end,
			description = "Open Neogit interface",
		},
	},
}
