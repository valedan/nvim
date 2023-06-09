vim.opt.backup = false            -- don't create a backup file when modifying files
vim.opt.writebackup = false       -- Don't create backups on every write
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.mouse = ""
vim.opt.pumheight = 10            -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0           -- never show tabs
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true     -- force all horizontal splits to go below current window
vim.opt.splitright = true     -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true  -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000     -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true       -- enable persistent undo
vim.opt.updatetime = 300      -- faster completion (4000ms default)
vim.opt.expandtab = true      -- convert tabs to spaces
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.shiftround = true     -- round indent
vim.opt.wrap = true           -- word wrap
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.cursorline = true     -- highlight the current line
vim.opt.number = true         -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 2       -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"    -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8         -- minimal number of lines to keep above and below cursor
vim.opt.sidescrolloff = 8

vim.cmd "set whichwrap+=[,],h,l" -- allow left and right arrows and h and l to wrap around to next or previous lines
vim.cmd [[set iskeyword+=-]]     -- treat hyphenated (or kebab case) words as a single word

vim.opt.autowriteall = true      -- Enable auto write

vim.opt.grepprg = "rg --vimgrep"
vim.opt.inccommand = "nosplit" -- preview incremental substitute
