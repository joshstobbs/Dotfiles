return {
	"chrisgrieser/nvim-spider",
	event = "VeryLazy",
	config = function()
		require("spider").setup({
			skipInsignificantPunctuation = false,
		})
	end,
}
