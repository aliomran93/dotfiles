local lspconfig = require 'lspconfig'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspsignature = require 'lsp_signature'
local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.intelephense.setup{
    on_attach = function(client, bufnr)
        on_attach = lspsignature.on_attach()
    end,
    capabilities = capabilities,
    root_dir = function()
        return vim.fn.getcwd()
    end
}

local phpactor_capabilities = capabilities

phpactor_capabilities.rename = {}

lspconfig.phpactor.setup{
    on_attach = function(client, bufnr)
        on_attach = lspsignature.on_attach()
    end,
    capabilities = phpactor_capabilities
}

lspconfig.elmls.setup {
    on_attach = function(client, bufnr)
        on_attach = lspsignature.on_attach()
    end,
    capabilities = capabilities
}

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
            with_text = true,
            maxwidth = 50,
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }
}
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

require("luasnip.loaders.from_vscode").lazy_load({
	include = nil, -- Load all languages
	exclude = {},
})

