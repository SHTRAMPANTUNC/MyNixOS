local u = require("utils")
local cb = u.lazy_rhs_cb

local map = vim.keymap.set

vim.g.mapleader = " "

-- ##################################################
-- ####			  NEOVIM KEYBINDINGS		     ####
-- ##################################################

--Better X bind
map("n", "x", '"_x')

--Paste without copy into register
map("x", "p", '"_c<Esc>p')

--CLose current window
map("n", "q", "<Cmd>close<CR>")

--Move cursor down (display and real line)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {
	expr = true,
})

--Move cursor up (display and real line)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {
	expr = true,
})

-- Change current working directory locally and print cwd after that,
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>")

-- Go to start or end of line
map({ "n", "x" }, "H", "^")
map({ "n", "x" }, "L", "g_")

--Save/Quite
map("n", "<C-q>", ":qa<CR>", { silent = true })
map("n", "<C-s>", ":w!<CR>", { silent = true })

--Spell
map("n", "<F10>", "<cmd>set spell!<cr>")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Split window
map("n", "\\", ":vsplit<Return><C-w>w", { silent = true })

--Move Indent
map("x", "<S-Tab>", "<gv")
map("x", "<Tab>", ">gv|")

-- focus direction
map("n", "<C-j>", ":wincmd h<CR>", { silent = true }) -- focus right
map("n", "<C-k>", ":wincmd l<CR>", { silent = true }) -- focus left
map("n", "<C-l>", ":wincmd j<CR>", { silent = true }) -- focus bottom
map("n", "<C-;>", ":wincmd k<CR>", { silent = true }) -- focus top

-- Change text without putting it into the vim register,
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

-- ##################################################
-- ####			  custom keybindings	         ####
-- ##################################################

--Move Line
map("n", "<A-j>", u.move_line("+"), { silent = true })
map("n", "<A-k>", u.move_line("-"), { silent = true })

--Surround
map("v", "<leader>sa", cb("modules.surround", "add_visual"))
map("n", "<leader>sa", cb("modules.surround", "add"))
map("n", "<leader>sr", cb("modules.surround", "remove"))
map("n", "<leader>sc", cb("modules.surround", "replace"))

--toggler
map("n", "<Leader>t", cb("modules.toggler", "toggle_word"), { desc = "Module Toggler: toggle word under cursor" })

-- ##################################################
-- ####			  plugins keybindings	         ####
-- ##################################################

--Tree
map("n", "<C-n>",":NvimTreeToggle<CR>",{ silent = true })

--Tabs
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader>x", ":BufferLinePickClose<CR>", { silent = true })
map("n", "<leader>b", ":BufferLinePick<CR>", { silent = true })

--Trouble
map("n", "<leader>d", ":Trouble<CR>", { silent = true })

-- ##################################################
-- ####			  GIT keybindings	             ####
-- ##################################################
map({ "n", "v" }, "<leader>gl", function()
	local mode = string.lower(vim.fn.mode())
	require("gitlinker").get_buf_range_url(mode)
end, {
	silent = true,
	desc = "get git permlink",
})

map("n", "<leader>gb", function()
	require("gitlinker").get_repo_url({
		action_callback = require("gitlinker").actions.open_in_browser,
	})
end, {
	silent = true,
	desc = "browse repo in browser",
})

map("n", "<leader>gc", ":Flog<CR>", { silent = true })
map("n", "<leader>gs", ":Git<CR>", { silent = true })
map("n", "<leader>gpl", ":Git pull<CR>", { silent = true })
map("n", "<leader>gpu", ":15 split|term git push<CR>", { silent = true })
map("n", "<leader>gd", ":DiffviewOpen<CR>")
map("n", "<leader>gdc", function()
	for _, view in ipairs(require("diffview.lib").views) do
		view:close()
	end
end)
