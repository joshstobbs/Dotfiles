return {
	"windwp/nvim-ts-autotag",
	event = "VeryLazy",
	config = function()
		require("nvim-ts-autotag").setup({
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = false,
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"astro",
				"glimmer",
				"handlebars",
				"hbs",
			},
		})
	end,
}
