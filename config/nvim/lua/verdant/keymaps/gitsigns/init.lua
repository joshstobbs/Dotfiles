return {
	itemgroup = "Gitsigns",
	description = "Manage git status",
	icon = "⬆️",
	keymaps = {
		{ "]h", "<CMD>Gitsigns next_hunk<CR>", description = "Next hunk", mode = { "n" } },
		{ "[h", "<CMD>Gitsigns prev_hunk<CR>", description = "Next hunk", mode = { "n" } },
		{ "<leader>gs", "<CMD>Gitsigns stage_hunk<CR>", description = "Stage hunk", mode = { "n" } },
		{ "<leader>gS", "<CMD>Gitsigns undo_stage_hunk<CR>", description = "Unstage hunk", mode = { "n" } },
		{ "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", description = "Preview hunk", mode = { "n" } },
		{ "<leader>gb", "<CMD>Gitsigns blame_line<CR>", description = "Line Blame", mode = { "n" } },
	},
}
