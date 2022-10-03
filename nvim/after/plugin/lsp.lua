local Remap = require('config.keymap')
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- Setup nvim-cmp.
local cmp = require('cmp')
local source_mapping = {
	buffer = '[Buffer]',
	nvim_lsp = '[LSP]',
	nvim_lua = '[Lua]',
	path = '[Path]',
}

local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
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
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion
		{ name = 'nvim_lsp' },

		{ name = 'luasnip' },

		{ name = 'buffer' },
	},
})

local function config(_config)
	return vim.tbl_deep_extend('force', {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap('<leader>gd', function() vim.lsp.buf.definition() end)
			nnoremap('K', function() vim.lsp.buf.hover() end)
			nnoremap('<leader>vws', function() vim.lsp.buf.workspace_symbol() end)
			nnoremap('<leader>vd', function() vim.diagnostic.open_float() end)
			nnoremap('[d', function() vim.diagnostic.goto_next() end)
			nnoremap(']d', function() vim.diagnostic.goto_prev() end)
			nnoremap('<leader>gca', function() vim.lsp.buf.code_action() end)
			nnoremap('<leader>gr', function() vim.lsp.buf.references() end)
			nnoremap('<F12>', function() vim.lsp.buf.rename() end)
			inoremap('<C-h>', function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require('lspconfig').intelephense.setup(config())

require('lspconfig').tsserver.setup(config())

require('lspconfig').sumneko_lua.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
}))

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require('symbols-outline').setup(opts)

local snippets_paths = function()
	local plugins = { 'friendly-snippets' }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. '/.vim/plugged/'
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require('luasnip.loaders.from_vscode').lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})
