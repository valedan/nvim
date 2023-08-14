-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init

local utils = require("utils")
local map = utils.map

-- Navigate by displayed lines
map("n", "<Down>", "gj", { silent = true })
map("n", "<Up>", "gk", { silent = true })

-- Move to window using the <ctrl> arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl-shift> arrow keys
map("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Resize window using <ctrl-shift> hjkl keys
map("n", "<C-S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<C-Left>", ":TmuxNavigateLeft<cr>", { desc = "Go to Left window" })
map("n", "<C-Down>", ":TmuxNavigateDown<cr>", { desc = "Go to Down window" })
map("n", "<C-Up>", ":TmuxNavigateUp<cr>", { desc = "Go to Up window" })
map("n", "<C-Right>", ":TmuxNavigateRight<cr>", { desc = "Go to Right window" })

-- Move Lines
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<leader>ft", "<cmd>ToggleTerm direction='vertical'<cr>", { desc = "Toggle Terminal" })

--harpoon
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon - Add file" })
map("n", "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon - View list" })
map("n", "<A-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-6>", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Harpoon - Go to file" })
map("n", "<A-[>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Harpoon - Prev file" })
map("n", "<A-]>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Harpoon - Next file" })

