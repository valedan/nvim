local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

if vim.g.vscode then
-- vscode extension
else
	vim.cmd([[
augroup autosave
    autocmd!
    autocmd TabLeave * silent! wall
    autocmd FocusLost * silent! wall
    autocmd BufLeave * silent! wall
augroup END
]])
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Adjust the pattern as needed
  callback = function()
    if vim.g.format_on_save then
      vim.lsp.buf.format({async = false, timeout_ms = 1000}) -- Adjust the timeout as needed
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
