local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local function lsp_highlight_document(client)
    -- When cursor is on a symbol, highlight that symbol throughout buffer
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec(
            [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
            false
        )
    end
end
--vim.lsp.buf.format()
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>af", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        -- Turn off formatting so we can let Prettier handle it instead (not set up yet)
        client.server_capabilities.documentFormattingProvider = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

return {
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        cmd = "Mason",
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                signs = {
                    active = signs,
                },
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            },
            -- Server settings
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                        },
                    },
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                diagnosticMode = "openFilesOnly",
                            }
                        }
                    },
                },
                jsonls = {},
            },
        },
        config = function(_, opts)
            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local lspconfig = require("lspconfig")

            local defaults = {
                on_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                    .make_client_capabilities())
            }

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", defaults, opts.servers[server] or {})
                lspconfig[server].setup(server_opts)
            end

            local ensure_installed = {}
            for server, _ in pairs(servers) do
                ensure_installed[#ensure_installed + 1] = server
            end

            local mlsp = require("mason-lspconfig")
            mlsp.setup({ ensure_installed = ensure_installed, automatic_installation = true })
            mlsp.setup_handlers({ setup })
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mason.nvim"
        },
        opts = function()
            local nls = require("null-ls")
            return {
                debug = true,
                sources = {
                    nls.builtins.formatting.stylua,
                },
            }
        end,
    }

}
