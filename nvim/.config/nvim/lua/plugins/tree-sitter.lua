return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        indent = {
            enable = false
        }
    },
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
            if added[lang] then
            return false
            end
            added[lang] = true
            return true
        end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.liquid = {
        install_info = {
            url = "~/tree-sitter/tree-sitter-liquid", -- local path or git repo
            files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
            -- optional entries:
            branch = "main", -- default branch in case of git repo if different from master
            generate_requires_npm = false, -- if stand-alone parser without npm dependencies
            requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "liquid", -- if filetype does not match the parser name
        }
    end,
}
