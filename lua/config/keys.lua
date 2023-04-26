local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- TODO: replace this with the one from lazyvim
local keymap = vim.api.nvim_set_keymap

local symbols_to_search = {
    "Class",
    "Function",
    "Method",
    "Constructor",
    "Interface",
    "Module",
    "Struct",
    "Trait",
    "Field",
    "Property",
}

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("i", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("i", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("i", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("i", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("s", "<A-j>", ":m .+1<CR>==", opts)
keymap("s", "<A-k>", ":m .-2<CR>==", opts)

keymap("n", "<A-k>", ":m .-2<CR>==", opts)
-- Maintain clipboard when pasting over things
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction='vertical'<cr>", {desc = "Toggle Terminal"})
keymap('n', "<leader>rt", "<cmd>RunPytest<cr>", {desc = "Run Pytest"})

-- Telescope --
keymap("n", "<leader>,", "<cmd>Telescope buffers<cr>", { desc = "Switch Buffer" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Switch Buffer" })
keymap("n", "<leader>sg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", { desc = "Find in Files (Grep)" })
keymap("n", "<leader>/", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Find in Files (Grep)" })
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find Files" })
keymap("n", "<leader>sc", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Status" })
keymap("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands" })
keymap("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffer" })
keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps" })
keymap("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>so", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
keymap("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "Resume" })
keymap("n", "<leader>se", "<cmd>SearchSession<cr>", { desc = "Search Session" })
keymap("n", "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", { desc = "Word (or Selection)" })
keymap("n", "<leader>uC", "<cmd>lua require('telescope.builtin').colorscheme({ enable_preview = true })<cr>",
    { desc = "Colorscheme" })
keymap("n", "<leader>ss",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = symbols_to_search })<cr>",
    { desc = "Symbols (document)" })
keymap("n", "<leader>sS",
    "<cmd>lua require('telescope.builtin').lsp_workspace_symbols({ symbols = symbols_to_search })<cr>",
    { desc = "Symbols (workspace)" })

keymap("n", "<leader>[", "<cmd>lua require('illuminate').goto_prev_reference()<cr>", { desc = "Prev reference" })
keymap("n", "<leader>]", "<cmd>lua require('illuminate').goto_next_reference()<cr>", { desc = "Next reference" })

-- Clear search with <esc>
keymap("n", "<esc>", "<cmd>noh<cr><esc>", opts)
keymap("i", "<esc>", "<cmd>noh<cr><esc>", opts)

-- save file
keymap("n", "<C-s>", "<cmd>w<cr><esc>", opts)
keymap("i", "<C-s>", "<cmd>w<cr><esc>", opts)

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- windows
keymap("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
keymap("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
keymap("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
keymap("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

--harpoon
keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon - Add file" })
keymap("n", "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon - View list" })
keymap("n", "<A-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-6>", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Harpoon - Go to file" })
keymap("n", "<A-[>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Harpoon - Prev file" })
keymap("n", "<A-]>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon - Next file" })
