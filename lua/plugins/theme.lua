return {
	{
		"folke/tokyonight.nvim",
  cond = not vim.g.vscode,
		lazy = false,
		priority = 1000,
		opts = { style = "moon" },
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		"sainnhe/sonokai",
  cond = not vim.g.vscode,
		opts = {},
		config = function()
			vim.g.sonokai_style = "default"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_dim_inactive_windows = 1
		end,
	},
}
