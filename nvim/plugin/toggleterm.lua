vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

vim.keymap.set(
	"n",
	"<leader>tr",
	"<cmd>ToggleTerm direction=horizontal<cr>",
	{ desc = "Open terminal horizontally (toggleterm)" }
)
vim.keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm direction=vertical<cr>",
	{ desc = "Open terminal vertically (toggleterm)" }
)
vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>ToggleTerm direction=float<cr>",
	{ desc = "Open terminal floating (toggleterm)" }
)

-- terminal navigation mappings
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- ToggleTerm configuration
require("toggleterm").setup({
	shading_factor = 0,
	float_opts = { border = "rounded" },
	size = function(term)
		if term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
		if term.direction == "horizontal" then
			return 12
		end
	end,
})
