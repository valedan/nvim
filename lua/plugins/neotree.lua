return {
  {
    "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
        enable_diagnostics = true,
        filesystem = {
            -- TODO: not working
            hijack_netrw_behavior = "open_current"
        },
        default_component_configs = {
                git_status = {
            symbols = {
              -- Change type
                added = " ",
                modified = " ",
                deleted = " ",
              renamed   = "󰁕",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
            }


    },
  }
}
