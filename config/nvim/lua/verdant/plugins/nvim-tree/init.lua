return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 40,
			},
			renderer = {
				group_empty = true,
				root_folder_label = false,
				symlink_destination = false,
				icons = {
					show = {
						folder_arrow = true,
					},
					glyphs = {
						folder = {
							arrow_closed = " ",
							arrow_open = " ",
							default = "",
							open = "",
							empty = "󱞞",
							empty_open = "󱞞",
							symlink = "",
							symlink_open = "",
						},
					},
				},
			},
			git = { ignore = false },
			filters = {
				dotfiles = false,
				custom = { "^\\.DS_Store" },
			},
			actions = {
				change_dir = {
					restrict_above_cwd = true,
				},
				open_file = {
					quit_on_open = true,
				},
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				api.config.mappings.default_on_attach(bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "<C-e>", "", opts)
				vim.keymap.del("n", "<C-e>", opts)
			end,
		})
	end,
}
