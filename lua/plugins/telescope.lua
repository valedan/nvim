return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		cmd = "Telescope",
		version = false, -- telescope did only one release, so use HEAD for now
		keys = {
			{
				"<leader>/",
				-- "<cmd>lua require'telescope.builtin'.live_grep{}<cr>",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				desc = "Live grep",
			},
			{
				"<leader>:",
				"<cmd>Telescope command_history<cr>",
				desc = "Command History",
			},
			{
				"<leader><space>",
				"<cmd>lua require'telescope.builtin'.find_files{}<cr>",
				desc = "Find Files",
			},
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<CR>",
				desc = "commits",
			},
			{
				"<leader>gs",
				"<cmd>Telescope git_status<CR>",
				desc = "status",
			},
			{
				'<leader>s"',
				"<cmd>Telescope registers<cr>",
				desc = "Registers",
			},
			{
				"<leader>sa",
				"<cmd>Telescope autocommands<cr>",
				desc = "Auto Commands",
			},
			{
				"<leader>sb",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Current Buffer",
			},
			{
				"<leader>sB",
				"<cmd>Telescope buffers show_all_buffers=true<cr>",
				desc = "Buffers",
			},
			{
				"<leader>sC",
				"<cmd>Telescope commands<cr>",
				desc = "Commands",
			},
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				desc = "Document diagnostics",
			},
			{
				"<leader>sD",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Workspace diagnostics",
			},
			{
				"<leader>sh",
				"<cmd>Telescope help_tags<cr>",
				desc = "Help Pages",
			},
			{
				"<leader>sH",
				"<cmd>Telescope highlights<cr>",
				desc = "Search Highlight Groups",
			},
			{
				"<leader>sk",
				"<cmd>Telescope keymaps<cr>",
				desc = "Key Maps",
			},
			{
				"<leader>sM",
				"<cmd>Telescope man_pages<cr>",
				desc = "Man Pages",
			},
			{
				"<leader>sm",
				"<cmd>Telescope marks<cr>",
				desc = "Jump to Mark",
			},
			{
				"<leader>so",
				"<cmd>Telescope vim_options<cr>",
				desc = "Options",
			},
			{
				"<leader>sr",
				"<cmd>Telescope resume<cr>",
				desc = "Resume",
			},
			{
				"<leader>sR",
				"<cmd>Telescope oldfiles<cr>",
				desc = "Recent",
			},
			{
				"<leader>sw",
				"<cmd>lua require'telescope.builtin'.grep_string{}<cr>",
				desc = "Grep String",
			},
			{
				"<leader>uc",
				"<cmd>lua require'telescope.builtin'.colorscheme{enable_preview=true}<cr>",
				desc = "Colorscheme with preview",
			},
			{
				"<leader>ss",
				"<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>",
				desc = "Goto Symbol",
			},
			{
				"<leader>sS",
				"<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<cr>",
				desc = "Goto Symbol (Workspace)",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				layout_config = {
					horizontal = {
						width = 0.9,
					},
				},
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<a-t>"] = function(...)
							return require("trouble.providers.telescope").open_selected_with_trouble(...)
						end,
						["<a-i>"] = function()
							local action_state = require("telescope.actions.state")
							local line = action_state.get_current_line()
							require("telescope.builtin").find_files({ no_ignore = true, default_text = line })
						end,
						["<a-h>"] = function()
							local action_state = require("telescope.actions.state")
							local line = action_state.get_current_line()
							require("telescope.builtin").find_files({ hidden = true, default_text = line })
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
						["<C-f>"] = function(...)
							return require("telescope.actions").preview_scrolling_down(...)
						end,
						["<C-b>"] = function(...)
							return require("telescope.actions").preview_scrolling_up(...)
						end,
					},
					n = {
						["q"] = function(...)
							return require("telescope.actions").close(...)
						end,
					},
				},
			},
		},
    config = function (_, opts)
      require("telescope").load_extension("live_grep_args")
      require("telescope").setup(opts)
    end
	},
}
