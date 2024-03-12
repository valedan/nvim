return {
    {
  "jackMort/ChatGPT.nvim",
  cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        chat = {
      loading_text = "Loading, please wait ...",
      question_sign = "",
                },
                openai_params = {
      model = "gpt-4",
      frequency_penalty = 0,
      presence_penalty = 0,
      max_tokens = 1000,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    openai_edit_params = {
      model = "gpt-4",
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
}
