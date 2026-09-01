return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				-- transparent = true,
				style = "night", 
				on_colors = function(colors)
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{ "neanias/everforest-nvim", priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 }
}
