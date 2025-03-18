return     {
    "projekt0n/github-nvim-theme",
    lazy = false, -- Cargarlo inmediatamente
    priority = 1000, -- Aplicarlo antes que otros temas
    config = function()
        require("github-theme").setup()
        vim.cmd("colorscheme github_dark_default")
    end
}

