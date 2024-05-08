local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("__status__", { clear = true })

vim.cmd("autocmd TermOpen * setlocal norelativenumber nonumber")
vim.cmd("autocmd TermOpen * startinsert")
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})

autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})

autocmd("BufEnter", {
	desc = "Rid auto comment for new string",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight copied text",
	callback = function()
		vim.highlight.on_yank({ higroup = "PmenuSel", timeout = 100 })
	end,
})

autocmd("BufWinEnter", {
	desc = "Open :help with vertical split",
	pattern = { "*.txt" },
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

autocmd("BufHidden", {
	desc = "Delete [No Name] buffers",
	callback = function(data)
		if data.file == "" and vim.bo[data.buf].buftype == "" and not vim.bo[data.buf].modified then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, data.buf, {})
			end)
		end
	end,
})

--Off highlight search
autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("modules.key_listener")
	end,
})

--Turn on plugin in Git Reposetori
local function check_git_repo()
	local cmd = "git rev-parse --is-inside-work-tree"
	if vim.fn.system(cmd) == "true\n" then
		vim.api.nvim_exec_autocmds("User", { pattern = "InGitRepo" })
		return true
	end
end

autocmd({ "VimEnter", "DirChanged" }, {
	callback = function()
		vim.schedule(check_git_repo)
	end,
})

autocmd("BufReadPost", {
	desc = "Jump to the last place you’ve visited in a file before exiting",
	callback = function()
		local ignore_ft = { "NvimTree_1", "toggleterm", "lazy" }
		local ft = vim.bo.filetype
		if not vim.tbl_contains(ignore_ft, ft) then
			local mark = vim.api.nvim_buf_get_mark(0, '"')
			local lcount = vim.api.nvim_buf_line_count(0)
			if mark[1] > 0 and mark[1] <= lcount then
				pcall(vim.api.nvim_win_set_cursor, 0, mark)
			end
		end
	end,
})

autocmd("InsertLeave", {
	nested = true,
	callback = function(info)
		if vim.bo[info.buf].bt == "" then
			vim.cmd.update({
				mods = { emsg_silent = true },
			})
		end
	end,
})
