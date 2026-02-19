return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",         -- LSP source
            "saadparwaiz1/cmp_luasnip",     -- LuaSnip source
            "L3MON4D3/LuaSnip",             -- snippet engine
            "rafamadriz/friendly-snippets", -- a ton of ready‑made snippets
        },
        event = "InsertEnter", -- lazy-load when you enter insert mode
        opts = function()
            local cmp = require("cmp")

            -- load vscode-style snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                mapping = vim.tbl_extend("force",
                    cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-o>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"]  = cmp.mapping.confirm({ select = true }),
                    }),
                    {
                        ["<Tab>"]   = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    }
                ),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
