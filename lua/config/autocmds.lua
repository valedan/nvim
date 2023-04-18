vim.cmd [[
augroup terminal_insert
    autocmd!
    autocmd TermOpen * startinsert
    autocmd BufWinEnter * if &buftype ==# 'terminal' | startinsert | endif
augroup END
]]

vim.cmd [[
augroup autosave
    autocmd!
    autocmd TabLeave * silent! wall
    autocmd FocusLost * silent! wall
    autocmd BufLeave * silent! wall
augroup END
]]
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
