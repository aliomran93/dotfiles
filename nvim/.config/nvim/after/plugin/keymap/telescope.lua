local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>rg", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") }) end)
nnoremap("<leader>fg", function() require('telescope.builtin').git_files() end)
nnoremap("<Leader>ff", function() require('telescope.builtin').find_files({hidden = true}) end)
nnoremap("<leader>fb", function() require('telescope.builtin').buffers() end)
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags() end)
nnoremap('<leader>dd', function() require('telescope.builtin').diagnostics({bufnr = 0}) end)
nnoremap('<leader>dda', function() require('telescope.builtin').diagnostics() end)
nnoremap("<leader>gr", function () require('telescope.builtin').lsp_references() end)

