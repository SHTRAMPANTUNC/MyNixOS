return {
    {
        "catppuccin/nvim",
        lazy = false,

        config = function()
            local mocha = require("catppuccin.palettes").get_palette("mocha")

            require("catppuccin").setup({
                flavour = "mocha",
                no_underline = true,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    functions = { "bold" },
                    keywords = { "italic" },
                },
                color_overrides = {
                    mocha = {
                        base = mocha.mantle,
                    },
                },
                highlight_overrides = {
                    mocha = {
                        NormalFloat = { bg = "none" },

                        NvimTreeFolderIcon = { fg = mocha.peach },
                        NvimTreeGitStagedIcon = { fg = mocha.green },
                        NvimTreeGitNewIcon = { fg = mocha.green },

                        PmenuSel = { bg = mocha.blue, fg = mocha.base },
                        CmpPmenu = { bg = mocha.surface0 },
                        CmpItemAbbr = { fg = mocha.overlay2 },
                        CmpItemAbbrMatch = { fg = mocha.blue, style = { "bold" } },

                        ["@keyword.import.cpp"] = { fg = mocha.red },
                        ["@namespace"] = { fg = mocha.yellow },
                        ["@string.cmake"] = { fg = mocha.red },
                        ["@constant.cmake"] = { fg = mocha.green },
                    },
                },
                integrations = {
                    cmp = true,
                    alpha = true,
                    flash = true,
                    gitsigns = true,
                    nvimtree = true,
                    lsp_saga = true,
                    treesitter = true,
                    notify = true,
                },
            })
            vim.cmd.colorscheme(PREF.ui.colorscheme)
        end,
    },
}
