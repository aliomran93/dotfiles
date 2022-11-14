local Remap = require('config.keymap')
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap('<leader>ls', function()  end)
nnoremap('<leader>dn', function() vim.diagnostic.goto_next() end)
nnoremap('<leader>dp', function() vim.diagnostic.goto_prev() end)
nnoremap('<leader>ca', function() vim.lsp.buf.code_action() end)
nnoremap('gh', function() vim.lsp.buf.hover() end)
nnoremap('gd', function() vim.lsp.buf.definition() end)
nnoremap('gD', function() vim.lsp.buf.declaration() end)
nnoremap('<F2>', function() vim.lsp.buf.rename() end)
inoremap('<C-h>', function() vim.lsp.buf.signature_help() end)
