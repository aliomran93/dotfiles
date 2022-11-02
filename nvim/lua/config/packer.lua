return require('packer').startup(function()
    use('wbthomason/packer.nvim')
    use('sbdchd/neoformat')

    use('lewis6991/gitsigns.nvim')

    -- Telescope
    use('nvim-lua/plenary.nvim')
    use('nvim-lua/popup.nvim')
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-fzf-native.nvim', {
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    })
    use('nvim-telescope/telescope-dap.nvim')

    -- LSP things
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/nvim-cmp')
    use('onsails/lspkind-nvim')
    use('nvim-lua/lsp_extensions.nvim')
    use('glepnir/lspsaga.nvim')
    use('simrat39/symbols-outline.nvim')
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    use('mbbill/undotree')

    -- Colorscheme/styling section
    use('gruvbox-community/gruvbox')
    use('folke/tokyonight.nvim')
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })
    use('romgrk/nvim-treesitter-context')
    use('p00f/nvim-ts-rainbow')

    -- dap for debugging
    use('rcarriga/nvim-dap-ui')
    use('mfussenegger/nvim-dap')
    use('theHamsta/nvim-dap-virtual-text')
end)

