-- dependencies:
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })

vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-n>"] = function(prompt_bufnr)
					actions.toggle_selection(prompt_bufnr)
					actions.move_selection_next(prompt_bufnr)
				end,
				["<C-N>"] = function(prompt_bufnr)
					actions.toggle_selection(prompt_bufnr)
					actions.move_selection_previous(prompt_bufnr)
				end,
				["<C-d>"] = function(prompt_bufnr)
                    actions.delete_buffer(prompt_bufnr)
                end,
				["<C-j>"] = function(prompt_bufnr)
                    actions.preview_scrolling_down(prompt_bufnr)
                end,
				["<C-k>"] = function(prompt_bufnr)
                    actions.preview_scrolling_up(prompt_bufnr)
                end,
				["<C-h>"] = function(prompt_bufnr)
                    actions.preview_scrolling_left(prompt_bufnr)
                end,
				["<C-l>"] = function(prompt_bufnr)
                    actions.preview_scrolling_right(prompt_bufnr)
                end,
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
			},
		},
	},
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files (telescope)" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Find files by string (telescope)" })
vim.keymap.set("n", "<leader>pr", builtin.resume, { desc = "View previous search (telescope)" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "View open buffers (telescope)" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find repo. files (telescope)" })
