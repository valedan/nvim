vim.cmd([[
    augroup autosave
        au TabLeave * silent! wall
        au FocusLost * silent! wall
        au BufLeave * silent! wall
    augroup END
]])

