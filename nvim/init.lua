vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false
-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

vim.o.tabstop = 4       
vim.o.expandtab = false
vim.o.softtabstop = 4 
vim.o.shiftwidth = 4
vim.g.editorconfig = false

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.wrap = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0
vim.opt.swapfile = false

-- remove ~ from blank lines
vim.opt.fillchars = 'eob: '

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})


vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	update_in_insert = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "*",
			[vim.diagnostic.severity.WARN]  = "*",
			[vim.diagnostic.severity.HINT]  = "*",
			[vim.diagnostic.severity.INFO]  = "*",
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})


-- keymaps
vim.api.nvim_set_keymap('v', '<C-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", "<cmd>Themery<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rr", "<cmd>checktime<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua = vim.lsp.buf.rename()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fm", "<cmd>lua = vim.lsp.buf.format()<CR>", { noremap = true })
vim.keymap.set("n", "gr", "<cmd>lua = vim.lsp.buf.references()<CR>", { noremap = true })
vim.keymap.set("n", "gd", "<cmd>lua = vim.lsp.buf.definition()<CR>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<cmd>lua = vim.lsp.buf.signature_help()<CR>", { noremap = true })
vim.keymap.set("n", "<C-c>", "<cmd>lua = vim.lsp.buf.code_action()<CR>", { noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({previewer = false }) end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = 'Telescope diagnostics' })

-- 1. Enable true color support (required for custom terminal cursor colors)
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'Cursor', { fg = '#ffffff', bg = '#ff007f' })
vim.opt.guicursor = 'n-v-c:block-Cursor'
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffffff", bg = "#ff007f" })
vim.opt.guicursor = "n-v-c:block-Cursor,i:ver25-Cursor"
