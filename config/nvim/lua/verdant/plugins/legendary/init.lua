return {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    config = function()
        local keymaps = require("verdant.keymaps")

        require("legendary").setup({
            default_opts = {
                keymaps = { silent = true, noremap = true },
            },
            include_builtin = true,
            include_legendary_cmds = true,
            select_prompt = "Keymaps",
            col_separator_char = "",
            formatter = nil,
            most_recent_item_at_top = true,
            keymaps = keymaps.default,
            -- commands = {},
            -- autocmds = {},
            -- which_key = {},
            auto_register_which_key = true,
        })
    end
}
