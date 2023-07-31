return {
  {
    "sainnhe/sonokai",
    opts = {},
    config = function()
      vim.g.sonokai_style = "espresso"
      vim.g.sonokai_better_performance = 2
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_dim_inactive_windows = 1
      vim.cmd("colorscheme sonokai")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
