return {
	{
		"jpalardy/vim-slime",
		lazy = false,
    cond = not vim.g.vscode,
		init = function()
			vim.g.slime_no_mappings = 1
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = {socket_name = "default", target_pane = "{top-right}"}
			-- vim.g.slime_bracketed_paste = 1
      vim.g.slime_python_ipython = 1
      vim.g.slime_dont_ask_default = 1
		end,
	},
  {
    'hanschen/vim-ipython-cell',
    cond = not vim.g.vscode,
    init = function ()
      vim.g.ipython_cell_send_ctrl_c = 0
      vim.g.ipython_cell_send_ctrl_u = 0
    end
  }
}
