return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            -- enable true color support
            if vim.fn.has("termguicolors") == 1 then
                vim.opt.termguicolors = true
            end

            -- theme settings
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.cmd("colorscheme everforest")
        end,
    },
}
