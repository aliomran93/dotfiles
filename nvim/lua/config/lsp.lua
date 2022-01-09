local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

local lspconfig = require'lspconfig'
lspconfig.intelephense.setup(config({
   root_dir = lspconfig.util.root_pattern('.gitmodules'),
   on_attach = function(client, bufnr)
       require 'lsp_signature'.on_attach()
   end,
}))

lspconfig.phpactor.setup{}


local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            maxwidth = 50,
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }
}

