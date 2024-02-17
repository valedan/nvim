return {
	{ "EdenEast/nightfox.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "moon" },
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		"sainnhe/sonokai",
		opts = {},
		config = function()
			vim.g.sonokai_style = "default"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_dim_inactive_windows = 1
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyWinSeparator = 1
		end,
	},
}
