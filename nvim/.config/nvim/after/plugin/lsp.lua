local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'intelephense',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  nnoremap("gd", function() vim.lsp.buf.definition() end)
  nnoremap("gD", function() vim.lsp.buf.decleration() end)
  nnoremap("gi", function() vim.lsp.buf.implementation() end)
  nnoremap("gr", function() vim.lsp.buf.references() end)
  nnoremap("K", function() vim.lsp.buf.hover() end)
  nnoremap("<F2>", function() vim.lsp.buf.rename() end)
  nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
  nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
  nnoremap("[d", function() vim.diagnostic.goto_next() end)
  nnoremap("]d", function() vim.diagnostic.goto_next() end)
  inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end)

lsp.nvim_workspace()

lsp.setup()

