return {
    "stevearc/conform.nvim",
    event = "BufRead",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                cpp = { "clang_format" },
                go = { "gofmt", "goimports" },
                html = { "prettier" },
                css = { "prettier" },
            },
        })
    end,
}
