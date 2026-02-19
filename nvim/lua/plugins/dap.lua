return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        opts = {
            handlers = {},
            ensure_installed = { "codelldb" }
        }
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("dapui").setup()

            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set('n', '\\b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint (dap)' })
            vim.keymap.set('n', '\\c', dap.continue, { desc = 'Run/continue debugger (dap)' })
            vim.keymap.set('n', '\\s', dap.step_into, { desc = 'Debugger step into(dap)' })
            vim.keymap.set('n', '\\S', dap.step_out, { desc = 'Debugger step out of(dap)' })
            vim.keymap.set('n', '\\n', dap.step_over, { desc = 'Debugger step over (dap)' })
            vim.keymap.set('n', '\\q', dap.terminate, { desc = 'Terminate debugger (dap)' })
        end
    }

}
