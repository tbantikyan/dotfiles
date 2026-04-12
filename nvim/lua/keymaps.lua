vim.keymap.set("t", "<S-Space>", "<Space>", {})
vim.keymap.set("t", "<S-Enter>", "<Enter>", {})
vim.keymap.set("t", "<S-BS>", "<BS>", {})

vim.keymap.set("n", "<C-j>", "<C-e>", { desc = "Scroll down one line" })
vim.keymap.set("n", "<C-k>", "<C-y>", { desc = "Scroll up one line" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open vim file explorer" })

vim.keymap.set(
	"n",
	"<leader>cc",
	':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>',
	{ desc = "Toggle background mode", noremap = true, silent = true }
)

vim.keymap.set("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true, desc = "Next autocomplete item" })
vim.keymap.set("i", "<S-Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true, desc = "Previous autocomplete item" })
vim.keymap.set("i", "<CR>", function()
	if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
		return "<C-y>"
	end
	return "<CR>"
end, { expr = true, silent = true, desc = "Accept autocomplete suggestion" })
