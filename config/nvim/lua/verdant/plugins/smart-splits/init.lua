return {
    "mrjones2014/smart-splits.nvim",
    priority = 10001,
    lazy = false,
    config = function()
        require("smart-splits").setup({})
    end
}
