-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
augroup autosave
    autocmd!
    autocmd TabLeave * silent! wall
    autocmd FocusLost * silent! wall
    autocmd BufLeave * silent! wall
augroup END
]])

vim.api.nvim_create_user_command("Copypath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("RunPytest", function()
  local path = vim.fn.expand("%:p")
  local cmd = "poetry run pytest " .. path .. " -s"
  vim.cmd(string.format("TermExec cmd='%s' go_back=0 direction='vertical'", cmd))
end, {})
