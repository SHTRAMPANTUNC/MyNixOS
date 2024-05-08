return {
	{
		"nvim-treesitter/nvim-treesitter",
		enable = true,
        lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
                    "go",
					"cpp",
					"lua",
                    "nix",
					"json",
					"cmake",
				},
				ignore_install = {},
				highlight = {
					enable = true,
					disable = { "help" },
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}
