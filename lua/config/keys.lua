local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
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
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)

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

-- Telescope --
keymap("n", "<leader>,", "<cmd>Telescope buffers<cr>", { desc = "Switch Buffer" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Switch Buffer" })
keymap("n", "<leader>sg", "<cmd>require'telescope.builtin'.live_grep()<cr>", { desc = "Find in Files (Grep)" })
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
keymap("n", "<leader>sR", "<cmd>Telescope resume<cr>", { desc = "Resume" })
keymap("n", "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<cr>", { desc = "Word (or Selection)" })
keymap("n", "<leader>uC", "<cmd>lua require('telescope.builtin').colorscheme({ enable_preview = true })<cr>",
    { desc = "Colorscheme" })
keymap("n", "<leader>ss",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = symbols_to_search })<cr>",
    { desc = "Symbols (document)" })
keymap("n", "<leader>ss",
    "<cmd>lua require('telescope.builtin').lsp_workspace_symbols({ symbols = symbols_to_search })<cr>",
    { desc = "Symbols (workspace)" })

keymap("n", "<leader>[", "<cmd>lua require('illuminate').goto_prev_reference()<cr>", { desc = "Prev reference" })
keymap("n", "<leader>]", "<cmd>lua require('illuminate').goto_next_reference()<cr>", { desc = "Next reference" })
