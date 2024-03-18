return {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = vim.list_extend(opts.sources or {}, {
            nls.builtins.diagnostics.phpcs.with({
                extra_args = { "--standard=PSR12" },
            }),
            nls.builtins.formatting.phpcsfixer.with({
                extra_args = { "--rules=@PSR12" },
            }),
        })
    end
}
