return {
	{ "michaeljsmith/vim-indent-object" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			-- char = "│",
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
}
