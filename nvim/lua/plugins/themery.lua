return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "tokyonight-storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "tokyonight-night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "tokyonight-moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "tokyonight-day",
					colorscheme = "tokyonight-day",
				},
				{
					name = "rosepine-main",
					colorscheme = "rose-pine-main",
				},
				{
					name = "rosepine-moon",
					colorscheme = "rose-pine-moon",
				},
				{
					name = "rosepine-dawn",
					colorscheme = "rose-pine-dawn",
				},
				{
					name = "everforest",
					colorscheme = "everforest",
				}
			},
		})
	end
}
