-- tweak the spell‑error highlight after the colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "SpellBad", {
            sp = "#98BB6C",               -- underline color
            undercurl = true,             -- use undercurl if available
        })
    end,
})
