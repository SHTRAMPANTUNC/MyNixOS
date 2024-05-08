PREF = {
	common = {
		textwidth = 130,
		tabwidth = 2,
	},

	lsp = {
		diagnostic = {
			underline = false,
			format_on_save = false,
			signs = true,
			virtual_text = false,
			severity_sort = true,
		},
		semantic_token = true,
		install_servers = {
			"cmake",
			"gopls",
			"nil_ls",
			"lua_ls",
			"jsonls",
			"clangd",
			"dockerls",
			"pyright",
			"tsserver",
		},
	},

	plugins = { -- <--- enable/disable optional plugins
		mason = false, -- disable for NixOS
		wakatime = false,
		markdown_preview = false,
		zen_mode = true,
	},

	ui = {
		signs = {
			Error = "🤮",
			Warn = "🤢",
			Hint = "🤯",
			Info = "🤓",
		},
		colorscheme = "catppuccin",
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
}
