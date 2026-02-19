return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "View git status (vim-fugitive)" });
            vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "View git file blame (vim-fugitive)" });
        end
    }
}
