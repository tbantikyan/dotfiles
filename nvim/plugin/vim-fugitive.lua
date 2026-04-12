vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "View git status (vim-fugitive)" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "View git file blame (vim-fugitive)" })
