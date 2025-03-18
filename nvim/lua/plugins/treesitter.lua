return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "go", "python", "lua", "javascript", "typescript", "html", "css", "scss" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

