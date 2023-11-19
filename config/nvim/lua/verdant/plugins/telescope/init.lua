return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "danielfalk/smart-open.nvim", branch = "0.2.x", dependencies = { "kkharji/sqlite.lua" } },
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                layout_config = { prompt_position = "top", },
                sorting_strategy = "ascending",
                path_display = { truncate = 1 },
                prompt_prefix = " ",
                selection_caret = " ",
                preview = { timeout = 200 },
                file_ignore_patterns = { "node_modules/", "vendor/", ".git/" },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                    },
                },
            },
            extensions = {
                smart_open = {
                    show_scores = false,
                    match_algorithm = "fzf",
                },
                live_grep_args = {
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                    },
                },
            }
        },
        pickers = {
                find_files = { hidden = true, follow = true },
                buffers = {
                    previewer = false,
                    layout_config = {
                        width = 80,
                    },
                },
                oldfiles = { prompt_title = "History" },
                lsp_references = { previewer = false },
                lsp_definitions = { previewer = false },
                lsp_document_symbols = { symbol_width = 55 },
            },
    })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("smart_open")
    end
}
