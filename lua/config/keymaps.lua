local function map(mode, lhs, rhs, opts)
	opts = opts or {} -- Ensure opts is a table if not provided
	opts.silent = opts.silent == nil and true or opts.silent -- Default to silent unless explicitly set
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.diagnostics_enabled = true
function toggle_diagnostics()
	vim.g.diagnostics_enabled = not vim.g.diagnostics_enabled
	if vim.g.diagnostics_enabled then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end

vim.g.format_on_save = true
function toggle_format_on_save()
	vim.g.format_on_save = not vim.g.format_on_save
	if vim.g.format_on_save then
		print("Format on save enabled")
	else
		print("Format on save disabled")
	end
end

-- Navigate by displayed lines
map("n", "<Down>", "gj")
map("n", "<Up>", "gk")
map("n", "j", "gj")
map("n", "k", "gk")

-- Window navigation
map("n", "<C-Left>", ":TmuxNavigateLeft<cr>")
map("n", "<C-Down>", ":TmuxNavigateDown<cr>")
map("n", "<C-Up>", ":TmuxNavigateUp<cr>")
map("n", "<C-Right>", ":TmuxNavigateRight<cr>")

map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Resize window using <ctrl-shift> arrow keys
map("n", "<C-S-Left>", ":vertical resize -2<cr>")
map("n", "<C-S-Down>", ":resize -2<cr>")
map("n", "<C-S-Up>", ":resize +2<cr>")
map("n", "<C-S-Right>", ":vertical resize +2<cr>")

-- Move Lines
map("n", "<A-Down>", ":m .+1<cr>==")
map("n", "<A-Up>", ":m .-2<cr>==")
map("i", "<A-Down>", "<esc>:m .+1<cr>==gi")
map("i", "<A-Up>", "<esc>:m .-2<cr>==gi")
map("v", "<A-Down>", ":m '>+1<cr>gv=gv")
map("v", "<A-Up>", ":m '<-2<cr>gv=gv")

map({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", ",", "@@", { desc = "Rerun last macro" })
map("n", "<leader>;", ",", { desc = "Previous f/t match" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

map("n", "zG", ":AddAllMisspelled<CR>", { desc = "Add all words to spell list" })

-- General navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Goto References" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
map("n", "]c", ":IPythonCellNextCell<CR>", { desc = "Next Cell" })
map("n", "[c", ":IPythonCellPrevCell<CR>", { desc = "Prev Cell" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

map("n", "<leader>d", "<cmd>Neotree toggle<cr>", { desc = "NeoTree" })

-- Files
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fwa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
map("n", "<leader>fwr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
map("n", "<leader>fwl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[W]orkspace [L]ist Folders" })

-- Trouble
map("n", "<leader>tl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>tL", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "<leader>tQ", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>tt", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics (Trouble)" })
map("n", "<leader>tT", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
map("n", "<leader>tc", "<cmd>TodoTrouble<cr>", { desc = "Todo Comments" })

-- Actions
map("n", "<leader>ar", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>af", vim.lsp.buf.format, { desc = "Format" })
map("n", "<leader>aF", ":call v:lua.toggle_format_on_save()<CR>", { desc = "Toggle format on Save" })
map("n", "<leader>aa", vim.lsp.buf.code_action, { desc = "Code Action" })

-- UI
map("n", "<leader>ud", ":call v:lua.toggle_diagnostics()<CR>", { desc = "Toggle Diagnostics" })
map("n", "<leader>uh", function()
	vim.lsp.inlay_hint(0, nil)
end, { desc = "Toggle Inlay Hints" })
map(
	"n",
	"<leader>uc",
	"<cmd>lua require'telescope.builtin'.colorscheme{enable_preview=true}<cr>",
	{ desc = "Colorschemes" }
)

-- Navigate
map(
	"n",
	"<leader>/",
	"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
	{ desc = "Live grep" }
)
map("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
map("n", "<leader><space>", "<cmd>lua require'telescope.builtin'.find_files{}<cr>", { desc = "Find Files" })
map("n", "<leader>nn", "<cmd>Telescope resume<cr>", { desc = "Resume" })
map("n", '<leader>n"', "<cmd>Telescope registers<cr>", { desc = "Registers" })
map("n", "<leader>na", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands" })
map("n", "<leader>nt", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter" })
map("n", "<leader>nb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current Buffer" })
map("n", "<leader>nB", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>nc", "<cmd>TodoTelescope<cr>", { desc = "Todo Comments" })
map("n", "<leader>nC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>nd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })
map("n", "<leader>nD", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>nh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
map("n", "<leader>nk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
map("n", "<leader>nm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>nM", "<cmd>Telescope marks<cr>", { desc = "Jump to Mark" })
map("n", "<leader>no", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
map("n", "<leader>ns", "<cmd>Telescope lsp_incoming_calls<cr>", { desc = "Incoming Call Stack" })
map("n", "<leader>nS", "<cmd>Telescope lsp_outgoing_calls<cr>", { desc = "Outgoing Call Stack" })
map("n", "<leader>nr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })
map("n", "<leader>nw", "<cmd>lua require'telescope.builtin'.grep_string{}<cr>", { desc = "Grep String" })

-- Send
map("n", "s", "<Plug>SlimeMotionSend", { desc = "Send motion" })
map("x", "s", "<Plug>SlimeRegionSend", { desc = "Send selection" })
map("n", "<leader>ss", ":IPythonCellExecuteCell<CR>", { desc = "Run Cell" })
map("n", "<C-CR>", ":IPythonCellExecuteCell<CR>", { desc = "Run Cell" })
map("i", "<C-CR>", "<Esc>:IPythonCellExecuteCell<CR>a", { desc = "Run Cell" })
map("n", "<leader>sa", ":IPythonCellRun<CR>", { desc = "Run All" })
map("n", "<leader>sN", ":IPythonCellInsertAbove<CR>", { desc = "Insert Cell Above" })
map("n", "<leader>sn", ":IPythonCellInsertBelow<CR>", { desc = "Insert Cell Below" })
map("n", "<leader>sc", ":IPythonCellClear<CR>", { desc = "Clear REPL" })
map("n", "<leader>sx", ":IPythonCellRestart<CR>", { desc = "Restart REPL" })

-- Git
map("n", "<leader>gc", "<cmd>Telescope git_bcommits<CR>", { desc = "Commits (Current Buffer)" })
map("n", "<leader>gC", "<cmd>Telescope git_commits<CR>", { desc = "Commits (Whole Repo)" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Status" })
map("n", "<leader>gl", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame Line" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
map("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff This" })
map("n", "<leader>gD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff This ~" })
map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map({ "n", "v" }, "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })

-- Notes
map("n", "<leader>ec", function()
	local obsidian = require("obsidian")
	local util = obsidian.util
	local line_num = unpack(vim.api.nvim_win_get_cursor(0)) -- 1-indexed
	local line = vim.api.nvim_get_current_line()
	local checkbox_pattern = "^%s*- %[.] "

	if not string.match(line, checkbox_pattern) then
		local unordered_list_pattern = "^(%s*)[-*+] (.*)"
		if string.match(line, unordered_list_pattern) then
			line = string.gsub(line, unordered_list_pattern, "%1- [ ] %2")
		else
			line = string.gsub(line, "^(%s*)", "%1- [ ] ")
		end
	elseif string.match(line, "^%s*- %[ %].*") then
		line = util.string_replace(line, "- [ ]", "- [x]", 1)
	elseif string.match(line, "^%s*- %[x%].*") then
		line = util.string_replace(line, "- [x]", "- [-]", 1)
	elseif string.match(line, "^%s*- %[%-%].*") then
		line = util.string_replace(line, "- [-]", "- [ ]", 1)
	end

	-- 0-indexed
	vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, { line })
end, { desc = "Toggle Checkbox" })
map("n", "<leader>eo", ":ObsidianOpen<CR>", { desc = "Open in Obsidian" })
map("n", "<leader>en", ":ObsidianNew<CR>", { desc = "New Note" })
map("n", "<leader>e<space>", ":ObsidianQuickSwitch<CR>", { desc = "Note Picker" })
map("n", "<leader>e/", ":ObsidianSearch<CR>", { desc = "Search in Notes" })
map("n", "<leader>eb", ":ObsidianBacklinks<CR>", { desc = "Backlinks" })
map("n", "<leader>et", ":ObsidianToday<CR>", { desc = "Today" })
map("n", "<leader>ex", ":ObsidianExtractNote<CR>", { desc = "Extract Note" })
map("n", "<leader>ee", ":InsertLog<CR>", { desc = "Insert Log" })

-- Buffers
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
