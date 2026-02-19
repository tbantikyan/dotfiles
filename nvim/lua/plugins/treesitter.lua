return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
                -- list of parsers to install
                ensure_installed = {
                    "go", "java", "javascript", "c", "lua",
                    "vim", "vimdoc", "query", "markdown", "markdown_inline",
                },
                sync_install = false, -- install parsers asynchronously
                auto_install = true, -- install missing parsers on buffer enter
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
}
