vim.pack.add({ "https://github.com/mbbill/undotree" })

vim.keymap.set("n", "<leader>gu", vim.cmd.UndotreeToggle, { desc = "Open undotree" })
