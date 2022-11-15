return require('packer').startup(function()
    use('wbthomason/packer.nvim') -- packer

    use('lewis6991/gitsigns.nvim') --show git diff signs
    use('TimUntersberger/neogit')

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
    use('hrsh7th/cmp-path')
    use('hrsh7th/nvim-cmp')
	use('tzachar/cmp-tabnine', { run = 'bash ./install.sh' })
    use('onsails/lspkind-nvim') -- better cmp menu
    use('simrat39/symbols-outline.nvim') -- better symbols
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
	use('williamboman/mason.nvim') -- manage lsps and linters
	use('jose-elias-alvarez/null-ls.nvim') -- support for linters

    -- Colorscheme/styling section
	use('catppuccin/nvim', {as = 'catppuccin'})
    use('nvim-lualine/lualine.nvim')

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

	-- quality of life
	use('numToStr/Comment.nvim')
	use('wakatime/vim-wakatime')
	use('mbbill/undotree')
end)

