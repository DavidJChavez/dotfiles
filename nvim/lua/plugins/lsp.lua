return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.angularls.setup({
                cmd = {
                    vim.fn.stdpath("data") .. "/mason/bin/ngserver",
                    "--stdio",
                    "--tsProbeLocations",
                    vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules",
                    "--ngProbeLocations",
                    vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules"
                },
                on_new_config = function(new_config,new_root_dir)
                    new_config.cmd = cmd
                end,
                filetypes = { "typescript", "html", "typescriptreact", "angular" },
            })
        end,
    }
}

