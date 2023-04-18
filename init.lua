require("config.keys")
require("config.autocmds")
require("config.options")
require("plugins.setup")

vim.g.sonokai_style = 'espresso'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 1

vim.cmd('colorscheme sonokai')
