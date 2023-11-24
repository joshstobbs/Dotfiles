return {
	itemgroup = "Spider",
	description = "Manage git status",
	icon = "📦",
	keymaps = {
		{ "w", "<CMD>lua require('spider').motion('w')<CR>", description = "Next word", mode = { "n", "o", "x" } },
		{ "e", "<CMD>lua require('spider').motion('e')<CR>", description = "Next word end", mode = { "n", "o", "x" } },
		{ "b", "<CMD>lua require('spider').motion('b')<CR>", description = "Back a  word", mode = { "n", "o", "x" } },
	},
}
