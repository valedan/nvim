return {
  {
    "folke/which-key.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>n"] = { name = "Navigate" },
        ["<leader>t"] = { name = "Trouble" },
        ["<leader>s"] = { name = "Send" },
        ["<leader>a"] = { name = "Action" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>gh"] = { name = "Hunks" },
        ["<leader>f"] = { name = "File" },
        ["<leader>fw"] = { name = "Workspace" },
        ["<leader>b"] = { name = "Buffer" },
        ["<leader>u"] = { name = "UI" },
        ["<leader>o"] = { name = "Obsidian" },
      })
    end,
    opts = {
      -- your cofiguration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
