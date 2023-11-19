return {
    itemgroup = "Telescope",
    description = "Various Telescope pickers",
    icon = "🔭",
    keymaps = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, description = "Search for files", mode = { "n", "v" } },
        { "<leader>fF", function() require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "All files" }) end, description = "Search for all files", mode = { "n", "v" } },
        { "<leader>fm", function() require("telescope.builtin").marks() end, description = "Search through marks", mode = { "n", "v" } },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, description = "Search open buffers", mode = { "n", "v" } },
        { "<leader>fr", function() require("telescope.builtin").oldfiles() end, description = "Search recent files", mode = { "n", "v" } },
        { "<leader>fS", function() require("telescope.builtin").lsp_document_symbols() end, description = "Search in LSP symbols", mode = { "n", "v" } },
        { "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end, description = "Search in files", mode = { "n", "v" } },
        { "<leader>fs", function() require("telescope").extensions.smart_open.smart_open() end, description = "Smart Search", mode = { "n", "v" } },
    }
}
