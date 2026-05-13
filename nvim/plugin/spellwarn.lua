vim.pack.add({ "https://github.com/ravibrock/spellwarn.nvim" })

require("spellwarn").setup({
	enable = true,
	severity = {
		spellbad = "WARN",
		spellcap = "HINT",
		spelllocal = "HINT",
		spellrare = "INFO",
	},
    prefix = "possible misspelling: ",
})
