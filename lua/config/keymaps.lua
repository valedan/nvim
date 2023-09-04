local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

local enabled = true
function _G.toggle_diagnostics()
  enabled = not enabled
  if enabled then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end
-- Navigate by displayed lines
map("n", "<Down>", "gj", defaults)
map("n", "<Up>", "gk", defaults)

-- Move to window using the <ctrl> arrow keys
map("n", "<C-Left>", "<C-w>h", defaults)
map("n", "<C-Down>", "<C-w>j", defaults)
map("n", "<C-Up>", "<C-w>k", defaults)
map("n", "<C-Right>", "<C-w>l", defaults)
map("n", "<C-Left>", ":TmuxNavigateLeft<cr>", defaults)
map("n", "<C-Down>", ":TmuxNavigateDown<cr>", defaults)
map("n", "<C-Up>", ":TmuxNavigateUp<cr>", defaults)
map("n", "<C-Right>", ":TmuxNavigateRight<cr>", defaults)

-- Resize window using <ctrl-shift> arrow keys
map("n", "<C-S-Left>", ":vertical resize -2<cr>", defaults)
map("n", "<C-S-Down>", ":resize -2<cr>", defaults)
map("n", "<C-S-Up>", ":resize +2<cr>", defaults)
map("n", "<C-S-Right>", ":vertical resize +2<cr>", defaults)

-- Resize window using <ctrl-shift> hjkl keys
map("n", "<C-S-h>", ":vertical resize -2<cr>", defaults)
map("n", "<C-S-j>", ":resize -2<cr>", defaults)
map("n", "<C-S-k>", ":resize +2<cr>", defaults)
map("n", "<C-S-l>", ":vertical resize +2<cr>", defaults)

-- Move Lines
map("n", "<A-Down>", ":m .+1<cr>==", defaults)
map("n", "<A-Up>", ":m .-2<cr>==", defaults)
map("i", "<A-Down>", "<esc>:m .+1<cr>==gi", defaults)
map("i", "<A-Up>", "<esc>:m .-2<cr>==gi", defaults)
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", defaults)
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", defaults)

map("n", "<leader>bb", "<cmd>e #<cr>", { noremap = true, silent = true, desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map("n", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = true, desc = "Escape and clear hlsearch" })
map("i", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = true, desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { noremap = true, silent = true, expr = true, desc = "Prev search result" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { noremap = true, silent = true, desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { noremap = true, silent = true, desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { noremap = true, silent = true, desc = "Quickfix List" })

-- toggle options
-- TODO: Get format toggle working
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>ud", ":call v:lua.toggle_diagnostics()<CR>", { noremap = true, silent = true, desc = "Toggle Diagnostics" })
-- if vim.lsp.inlay_hint then
  -- map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
-- end

map("n", "<leader>-", "<C-W>s", { desc = "Split window below", silent = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", silent = true })
