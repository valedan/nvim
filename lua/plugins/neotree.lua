return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
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
