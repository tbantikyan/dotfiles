vim.pack.add({ "https://github.com/saghen/blink.cmp" })
require("blink.cmp").setup({
	keymap = {
        -- enter: accept completion
        -- tab, shift-tab: cycle completions
        -- space: open completion menu; within menu, open documentation
        -- ctrl-e: close completion menu
        -- ctrl-k: show signature
		preset = "enter",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = false },
		list = {
			selection = { preselect = false },
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})

-- TODO: migrate to builtin completion fucntionality when it is improved
-- vim.o.autocomplete = true
-- vim.o.complete = "o,.,w,b,u"
-- vim.o.completeopt = "fuzzy,menuone,noselect,popup"

-- vim.keymap.set("i", "<Tab>", function()
-- 	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
-- end, { expr = true, silent = true, desc = "Next autocomplete item" })
-- vim.keymap.set("i", "<S-Tab>", function()
-- 	return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
-- end, { expr = true, silent = true, desc = "Previous autocomplete item" })
-- vim.keymap.set("i", "<CR>", function()
-- 	if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
-- 		return "<C-y>"
-- 	end
-- 	return "<CR>"
-- end, { expr = true, silent = true, desc = "Accept autocomplete suggestion" })
