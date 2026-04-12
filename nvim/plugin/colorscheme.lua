--
-- Gruvbox Material
--
-- vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" })
--
-- -- theme settings
-- vim.o.background = "light"
-- vim.g.gruvbox_material_background = "soft"
-- vim.cmd.colorscheme("gruvbox-material")

--
-- Monokai Pro
--
vim.pack.add({ "https://github.com/vinitkumar/monokai-pro-vim" })
vim.o.background = "light"
vim.cmd.colorscheme("monokai-pro-light")

vim.keymap.set(
	"n",
	"<leader>cc",
	function()
		if vim.o.background == "light" then
			vim.o.background = "dark"
			vim.cmd.colorscheme("monokai-pro-machine")
		else
			vim.o.background = "light"
			vim.cmd.colorscheme("monokai-pro-light")
		end
	end,
	{ desc = "Toggle background mode", noremap = true, silent = true }
)

