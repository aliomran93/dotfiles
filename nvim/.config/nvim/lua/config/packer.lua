return require('packer').startup(function(use)
    use('wbthomason/packer.nvim') -- packer

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        }
    }
    use('nvim-telescope/telescope-dap.nvim')

    -- LSP things
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
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
	use('lukas-reineke/indent-blankline.nvim')
    use('nvim-tree/nvim-tree.lua')
    use('f-person/git-blame.nvim')
    use('theprimeagen/harpoon')
    use('folke/which-key.nvim')
end)

