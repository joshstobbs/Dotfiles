return {
	itemgroup = "Manage splits...",
	description = "Manage split creation, sizing, and cursor position",
	icon = "↔️",
	keymaps = {
		-- Create splits
		{ "<leader>v", ":vsp<CR>", description = "Create vertical split", mode = { "n", "v" } },
		{ "<leader>h", ":sp<CR>", description = "Create horizontal split", mode = { "n", "v" } },

		-- resizing splits
		-- these keymaps will also accept a range,
		-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
		{
			"<A-h>",
			function()
				require("smart-splits").resize_left()
			end,
			description = "Resize split left",
		},
		{
			"<A-j>",
			function()
				require("smart-splits").resize_down()
			end,
			description = "Resize split down",
		},
		{
			"<A-k>",
			function()
				require("smart-splits").resize_up()
			end,
			description = "Resize split up",
		},
		{
			"<A-l>",
			function()
				require("smart-splits").resize_right()
			end,
			description = "Resize split right",
		},
		-- moving between splits
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			description = "Focus split left",
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			description = "Focus split down",
		},
		-- {
		-- 	"<C-;>",
		-- 	function()
		-- 		require("smart-splits").move_cursor_down()
		-- 	end,
		-- 	description = "Focus split down",
		-- },
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			description = "Focus split up",
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			description = "Focus split right",
		},
	},
}
