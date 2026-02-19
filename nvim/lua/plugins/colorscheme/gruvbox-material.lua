return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- enable true color support
            if vim.fn.has("termguicolors") == 1 then
                vim.opt.termguicolors = true
            end

            -- theme settings
            vim.o.background = "dark"
            vim.g.gruvbox_material_background = 'soft'
            vim.cmd.colorscheme('gruvbox-material')

        end,
    },
}
