return {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
        require("Comment").setup({
            padding = true,
            sticky = true,
            toggler = {
                line = "gcc",
                block = "gbc"
            },
            opleader = {
                line = "gc",
                block = "gb"
            },
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end
}
