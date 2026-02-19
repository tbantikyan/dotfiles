vim.keymap.set("t", "<S-Space>", "<Space>", {})
vim.keymap.set("t", "<S-Enter>", "<Enter>", {})
vim.keymap.set("t", "<S-BS>", "<BS>", {})

vim.keymap.set("n", "<C-j>", "<C-e>", { desc = "Scroll down one line" })
vim.keymap.set("n", "<C-k>", "<C-y>", { desc = "Scroll up one line" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open vim file explorer" })

vim.keymap.set("n", "<leader>cc", ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>',
    { desc = "Toggle background mode", noremap = true, silent = true })
