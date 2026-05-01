vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

-- Prepend command with number to open terminal with that ID
local function custom_toggle(direction)
	local terms = require("toggleterm.terminal")
	local all_terms = terms.get_all(true)
	local any_open = false
	local open_term_direction = nil

	for _, term in ipairs(all_terms) do
		if term:is_open() then
			term:close()
			any_open = true
			open_term_direction = term.direction
		end
	end

	local id = vim.v.count
	if id == 0 then
		id = 1
	end

	-- If no terminal was open, or if the open terminal had a different direction,
	-- or if a specific count was provided, open the new terminal.
	if not any_open or open_term_direction ~= direction or vim.v.count ~= 0 then
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
vim.keymap.set("n", "<leader>tq", function()
	local terms = require("toggleterm.terminal")
	for _, term in ipairs(terms.get_all(true)) do
		term:shutdown()
	end
end, { desc = "Delete all toggleterm buffers" })

local function show_toggleterm_buffers()
	local terms = require("toggleterm.terminal").get_all(true)
	if #terms == 0 then
		print("No toggleterm buffers found")
		return
	end

	vim.ui.select(terms, {
		prompt = "ToggleTerm Buffers",
		format_item = function(term)
			local info = "Terminal " .. term.id .. " (" .. term.direction .. ")"
			if term.bufnr and vim.api.nvim_buf_is_valid(term.bufnr) then
				local name = vim.api.nvim_buf_get_name(term.bufnr)
				local pid = name:match("term://.*//(%d+):")
				if pid then
					local cmd = vim.fn.system("ps -o comm= --ppid " .. pid .. " | tail -n 1"):gsub("^%s*(.-)%s*$", "%1")
					if cmd ~= "" then
						return info .. " [" .. cmd .. "]"
					end
				end
			end
			return info
		end,
	}, function(selected)
		if selected then
			local terms = require("toggleterm.terminal").get_all(true)
			for _, term in ipairs(terms) do
				if term.id ~= selected.id and term:is_open() then
					term:close()
				end
			end
			require("toggleterm").toggle(selected.id)
		end
	end)
end
vim.keymap.set("n", "<leader>tl", show_toggleterm_buffers, { desc = "View toggleterm buffers" })

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
		local statusline = "Terminal[" .. term.id .. "] " .. " [-]"
		vim.api.nvim_set_option_value("statusline", statusline, { win = term.window })
	end,
})
