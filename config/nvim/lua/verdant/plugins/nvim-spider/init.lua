return {
	"chrisgrieser/nvim-spider",
	event = "VeryLazy",
	config = function()
		require("spider").setup({})
	end,
}
