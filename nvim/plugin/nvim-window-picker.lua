vim.pack.add({ "https://github.com/s1n7ax/nvim-window-picker" })
require 'window-picker'.setup()

vim.keymap.set("n", "<leader>w", function()
    local picked_window_id = require('window-picker').pick_window({
        include_current_win = true,
        hint = 'floating-big-letter'
    })
    if picked_window_id then
        vim.api.nvim_set_current_win(picked_window_id)
    end
end, { desc = "Pick a window (nvim-window-picker)" })
