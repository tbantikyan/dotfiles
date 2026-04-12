vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local wk = require("which-key")
wk.setup({})

vim.keymap.set("n", "<leader>?", function()
	wk.show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
