return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- load when opening a buffer
        config = function()
            require("gitsigns").setup()
        end,
    },
}
