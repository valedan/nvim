return {
  {
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				else
					return 20
				end
			end,
			shade_terminals = false,
			shading_factor = -100,
			persist_mode = false,
		},
	},

}
