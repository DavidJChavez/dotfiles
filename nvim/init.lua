vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "go", "python", "lua", "javascript", "typescript" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").gopls.setup({})
        end
    },
    -- github-nvim-theme
    {
        "projekt0n/github-nvim-theme",
        lazy = false, -- Cargarlo inmediatamente
        priority = 1000, -- Aplicarlo antes que otros temas
        config = function()
            require("github-theme").setup()
            -- vim.cmd("colorscheme github_dark")
        end
    }
})

vim.cmd("colorscheme github_dark_default")

