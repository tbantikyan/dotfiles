vim.pack.add({ "https://github.com/s1n7ax/nvim-window-picker" })

local window_picker = require("window-picker")
window_picker.setup({
	hint = "floating-big-letter",
	show_prompt = false,
	filter_rules = {
		bo = {
			-- don't filter out terminal buffers
			buftype = {},
		},
	},
})

vim.keymap.set("n", "<leader>w", function()
	local picked_window_id = window_picker.pick_window({
		include_current_win = true,
	})
	if picked_window_id then
		vim.api.nvim_set_current_win(picked_window_id)
	end
end, { desc = "Pick a window (nvim-window-picker)" })
