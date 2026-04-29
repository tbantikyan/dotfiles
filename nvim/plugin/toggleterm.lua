vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

-- Prepend command with number to open terminal with that ID
local function custom_toggle(direction)
	local terms = require("toggleterm.terminal")
	local all_terms = terms.get_all(true)
	local any_open = false

	for _, term in ipairs(all_terms) do
		if term:is_open() then
			term:close()
			any_open = true
		end
	end

    -- Command without a count should always just toggle off in the event that
    -- a toggleterm buffer is already open. If there is a count, replace the
    -- existing toggleterm buffer.
	local id = vim.v.count
	if not any_open or id ~= 0 then
		if id == 0 then
			id = 1
		end
		require("toggleterm").toggle(id, nil, nil, direction)
	end
end

vim.keymap.set("n", "<leader>tr", function()
	custom_toggle("horizontal")
end, { desc = "Toggle terminal horizontal" })
vim.keymap.set("n", "<leader>tv", function()
	custom_toggle("vertical")
end, { desc = "Toggle terminal vertical" })
vim.keymap.set("n", "<leader>tf", function()
	custom_toggle("float")
end, { desc = "Toggle terminal float" })
vim.keymap.set("n", "<leader>td", function()
	local terms = require("toggleterm.terminal")
	for _, term in ipairs(terms.get_all(true)) do
		term:shutdown()
	end
end, { desc = "Delete all toggleterm buffers" })

-- terminal navigation mappings
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "\\<esc>", "<esc>", opts) -- send esc to terminal
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
	on_open = function(term)
		local statusline = "Terminal[" .. term.id .. "] "  .. " [-]"
		vim.api.nvim_set_option_value("statusline", statusline, {win = term.window})
	end,
})
