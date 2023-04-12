vim.cmd([[
    augroup autosave
        au TabLeave * silent! wall
        au FocusLost * silent! wall
        au BufLeave * silent! wall
    augroup END
]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
