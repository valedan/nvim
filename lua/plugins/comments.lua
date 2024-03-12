return {
{
    'numToStr/Comment.nvim',
  cond = not vim.g.vscode,
    opts = {
        -- add any options here
    },
    lazy = false,
},
{
  "folke/todo-comments.nvim",
  cond = not vim.g.vscode,
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
}
}
