return {
    itemgroup = "LSP",
    description = "Run various lsp functions",
    icon = "🐳",
    keymaps = {
        { "gR", function() vim.lsp.buf.rename() end, description = "Rename symbol", mode = { "n", "v" } },
        { "gh", function() vim.lsp.buf.hover() end, description = "Show hover docs", mode = { "n", "v" } },
    }
}
