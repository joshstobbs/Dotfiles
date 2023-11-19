return {
    itemgroup = "Flash",
    description = "Navigate using Flash",
    icon = "⚡",
    keymaps = {
        {
            "s",
            function ()
                require("flash").jump({
                    --[[ search = {
                        mode = function(str)
                            return "\\<" .. str
                        end,
                    } ]]
                })
            end,
            description = "Jump to target",
            mode = { "n", "x", "o" },
            opts
        },
        {
            "s", 
            function ()
                require("flash").remote()
            end,
            description = "Jump to remote target",
            mode = { "o" },
            opts
        },
        {
            "S",
            function()
                require("flash").treesitter({})
            end,
            description = "Jump to Treesitter node",
            mode = { "n", "x", "o" },
            opts
        },
        {
            "r",
            function()
                require("flash").remote({})
            end,
            description = "Jump to remote target",
            mode = { "o" },
            opts
        },
        {
            "R",
            function()
                require("flash").treesitter_search({})
            end,
            description = "Search through Treesitter nodes",
            mode = { "n", "x", "o" },
            opts
        },
    }
}
