vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" })

-- enable true color support
if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

-- theme settings
vim.o.background = "light"
vim.g.gruvbox_material_background = "soft"
vim.cmd.colorscheme("gruvbox-material")
