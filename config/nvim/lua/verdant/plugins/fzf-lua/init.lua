return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			"default-title",
			defaults = { formatter = "path.filename_first" },
		})
	end,
}
