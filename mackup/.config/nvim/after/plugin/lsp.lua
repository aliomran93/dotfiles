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
	cmp_tabnine = '[TN]',
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
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		{ name = 'nvim_lsp' },

		{ name = "cmp_tabnine" },

		{ name = 'luasnip' },

		{ name = 'buffer' },

		{ name = 'path' },
	},
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function config(_config)
	return vim.tbl_deep_extend('force', {
		capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

require('lspconfig').intelephense.setup(config())

require('lspconfig').phpstan.setup(config())

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
