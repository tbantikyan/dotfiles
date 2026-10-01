vim.pack.add({ "https://github.com/voldikss/vim-floaterm" })

local function custom_toggle(wintype)
	return function()
		local id = vim.v.count1

		local format_cmd = ""
		if wintype == "float" then
			format_cmd = "FloatermUpdate --wintype=float --height=0.9 --width=0.9 --position=center"
		elseif wintype == "split" then
			format_cmd = "FloatermUpdate --wintype=split --height=12"
		elseif wintype == "vsplit" then
			format_cmd = "FloatermUpdate --wintype=vsplit --width=0.3"
		end

		vim.cmd("FloatermHide!")
		vim.cmd(string.format("FloatermToggle --name=Terminal %s", id))
		vim.cmd(format_cmd)

		-- Remove line numbers for split and vsplit buffers.
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		-- Set buffer name, as no title visible.
		vim.api.nvim_buf_set_name(0, "Terminal " .. id)
	end
end

vim.keymap.set("n", "<leader>tr", custom_toggle("split"), { desc = "Toggle terminal horizontal" })
vim.keymap.set("n", "<leader>tf", custom_toggle("float"), { desc = "Toggle terminal float" })
vim.keymap.set("n", "<leader>tv", custom_toggle("vsplit"), { desc = "Toggle terminal vertical" })
vim.keymap.set("n", "<leader>tq", function()
	vim.cmd("FloatermKill!")
end, { desc = "Delete all floaterm buffers" })

-- List all active floaterm buffers and open the selected one.
local function select_terminal()
	local bufnrs = vim.fn["floaterm#buflist#gather"]()
	if #bufnrs == 0 then
		vim.notify("No active floaterm buffers", vim.log.levels.INFO)
		return
	end

	local lines = { "Select terminal by ID:" }
    local names = {}
	for _, bufnr in ipairs(bufnrs) do
		local name = vim.fn["floaterm#config#get"](bufnr, "name", "")
        names[name] = true
		table.insert(lines, name)
	end
	table.insert(lines, "> ")

	-- Read the raw user input (e.g. "5"), not a list index.
	-- pcall guards against <C-c>, which raises an error in input().
	local ok, input = pcall(vim.fn.input, table.concat(lines, "\n"))
	if not ok or input == "" then
		return
	end
    if not names["Terminal " .. input] then
		vim.notify("Invalid terminal ID: " .. input, vim.log.levels.WARN)
		return
	end

	vim.cmd("FloatermHide!")
	-- Re-open with the terminal's existing wintype/size.
	vim.cmd(string.format("FloatermToggle Terminal %s", input))
end

vim.keymap.set("n", "<leader>tl", select_terminal, { desc = "List terminals" })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "\\<esc>", [[<C-\><C-n>]], opts) -- return to Normal mode
	vim.keymap.set("t", "<esc>", "<esc>", opts) -- send esc to terminal
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
