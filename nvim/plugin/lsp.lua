vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

vim.schedule(function()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua_ls",
			"stylua",
		},
	})
end)

vim.diagnostic.config({ virtual_text = true })

-- keymaps
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Display hover information" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation" })
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to definition of symbol's type" })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "List references to symbol" })
vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
vim.keymap.set(
	"n",
	"ge",
	"<cmd>lua vim.lsp.buf.code_action()<cr>",
	{ desc = "Display code actions available at current position" }
)
vim.keymap.set(
	"n",
	"gf",
	"<cmd>lua vim.diagnostic.open_float()<cr>",
	{ desc = "Display diagnostic message in floating window" }
)

vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format({ timeout_ms = 15000 }) -- typical swift development experience
end, { desc = "Format buffer (LSP)" })

-- LSP configurations
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
	cmd = {
		-- see clangd --help-hidden
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--header-insertion=iwyu",
	},
})
vim.lsp.enable("clangd")

-- Configure sourcekit-lsp specifically for Swift (so it doesn't conflict with clangd for C/C++)
vim.lsp.config("sourcekit", {
	filetypes = { "swift" },
})
vim.lsp.enable("sourcekit")
