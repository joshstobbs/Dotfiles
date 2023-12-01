local telescope = require("verdant.keymaps.telescope")
local flash = require("verdant.keymaps.flash")
local smart_splits = require("verdant.keymaps.smart-splits")
local lsp = require("verdant.keymaps.lsp")
local gitsigns = require("verdant.keymaps.gitsigns")
local spider = require("verdant.keymaps.spider")

return {
	default = {
		telescope,
		flash,
		smart_splits,
		lsp,
		gitsigns,
		spider,
		-- { "[hotkey]", "[command]", description = "", mode = { "n", "x" } },
		{ "<leader><tab>", "<C-^>", description = "Switch to previous file", mode = { "n", "x", "v" } },
		{ "<leader>q", ":q<CR>", description = "Quit files", mode = { "n", "x", "v" } },
		{ "<leader>w", ":w<CR>", description = "Write file", mode = { "n", "x", "v" } },

		{ "<C-e>", "<cmd>NvimTreeFindFileToggle<CR>", description = "Show file tree", mode = { "n", "x", "v" }, opts },
		{
			"<leader>e",
			"<cmd>NvimTreeFindFileToggle<CR>",
			description = "Show file tree",
			mode = { "n", "x", "v" },
			opts,
		},

		-- Move text by rows not lines when indenting
		{ "k", "v:count == 0 ? 'gk' : 'k'", description = "Move up", mode = { "n" }, opts = { expr = true } },
		{ "j", "v:count == 0 ? 'gj' : 'j'", description = "Move down", mode = { "n" }, opts = { expr = true } },

		-- Reselect visual selection after indenting.
		{ ">", ">gv", description = "Indent", mode = { "v" } },
		{ "<", "<gv", description = "Outdent", mode = { "v" } },

		-- Maintain cursor position when yanking a visual selection
		{ "y", "myy`y", description = "Yank", mode = { "v" } },

		-- Quick insert of text from insert mode
		{ ";;", "<Esc>A;", description = "Add trailing semicolon", mode = { "i" } },
		{ ",,", "<Esc>A,", description = "Add trailing comma", mode = { "i" } },

		-- More ergonomic redo
		{ "U", "<C-r>", description = "Redo", mode = { "n", "x" } },

		-- Quick Enter Visual Line
		{ "vv", "V", description = "Enter visual line mode", mode = { "n" } },

		-- Move lines up and down.
		{ "<S-k>", { n = ":move .-2<CR>==", v = ":move '>-2<CR>gv=gv" }, description = "Move line up" },
		{ "<S-j>", { n = ":move .+1<CR>==", v = ":move '>+1<CR>gv=gv" }, description = "Move line down" },

		{ "<C-u>", "<C-o>O", description = "Insert newline above", mode = { "i" } },

		{
			"gJ",
			function()
				require("treesj").join()
			end,
			description = "Join line",
			mode = { "n", "v" },
		},
		{
			"gS",
			function()
				require("treesj").split()
			end,
			description = "Split line",
			mode = { "n", "v" },
		},

		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			description = "Open all folds",
			mode = { "n" },
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			description = "Close all folds",
			mode = { "n" },
		},

		{
			"<ESC>",
			"<C-\\><C-n>",
			description = "Leave insert mode in terminal",
			mode = { "t" },
		},

		{
			"<leader>lm",
			":!php artisan make:",
			description = "Laravel make me...",
			mode = { "n" },
		},

		{ "<D-o>", "<cmd>NvimTreeFindFileToggle<CR>", description = "Show file tree", mode = { "n", "x", "v" }, opts },

		-- look for adding one shiftwidth
		-- look for removing one shiftwidth
	},
}
