return {
	{ "sainnhe/sonokai" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local git = {
				added = " ",
				modified = " ",
				removed = " ",
			}
			local diagnostics = {
				error = " ",
				warn = " ",
				hint = " ",
				info = " ",
			}
			require("lualine").setup({
				sections = {
					lualine_b = {
						{ "branch" },
						{ "diff", symbols = git },
						{ "diagnostics", symbols = diagnostics },
					},
					lualine_c = {
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = { left = 1, right = 0 },
						},
						{ "filename", path = 1, symbols = { modified = "  " } },
					},
                    lualine_x = {'encoding'}
				},
			})
		end,
	},
}
