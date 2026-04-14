vim.cmd.packadd("nvim.undotree")

vim.keymap.set("n", "<leader>gu", vim.cmd.Undotree, { desc = "Open undotree" })
