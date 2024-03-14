vim.api.nvim_create_user_command("InsertLog", function()
	vim.cmd("ObsidianToday")

	-- Find the line containing "<!-- End of Log -->"
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local end_of_log_line = nil
	for i, line in ipairs(lines) do
		if line:match("<!%-%- End of Log %-%->") then
			end_of_log_line = i
			break
		end
	end

	-- If the end of log marker is found, insert the new log line above it
	if end_of_log_line then
		local current_time = os.date("%H:%M")
		vim.api.nvim_buf_set_lines(
			bufnr,
			end_of_log_line - 1,
			end_of_log_line - 1,
			false,
			{ string.format(" - [%s] ", current_time) }
		)
		vim.api.nvim_win_set_cursor(0, { end_of_log_line, 0 }) -- Move cursor to the inserted line
		vim.api.nvim_feedkeys("A", "n", true) -- Append mode after the inserted time
	else
		print("End of Log marker not found.")
	end
end, {})

vim.api.nvim_create_user_command("AddAllMisspelled", function()
	-- Ensure spell checking is enabled for the current window
	vim.api.nvim_win_set_option(0, "spell", true)

	-- Iterate over each line in the buffer
	for line_num = 1, vim.api.nvim_buf_line_count(0) do
		local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
		local col = 1
		while col <= #line do
			local badword, badword_type = unpack(vim.fn.spellbadword(line:sub(col)))
			if badword == "" then
				break
			end -- No more misspelled words in this part of the line
			if badword_type == "bad" then
				-- Move the cursor to the start of the bad word
				vim.api.nvim_win_set_cursor(0, { line_num, col - 1 })
				-- Add the bad word to the spell list
				vim.cmd("silent! normal! zg")
			end
			-- Advance column past the current bad word
			col = col + #badword
		end
	end

	vim.api.nvim_out_write("All misspelled words added.\n")
end, {})
