" Plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    " Utils
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-startify'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/tmux-complete.vim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'

    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " aesthetics
    Plug 'itchyny/lightline.vim'
    Plug 'gruvbox-community/gruvbox'

    " Db
    Plug 'tpope/vim-dadbod'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'onsails/lspkind-nvim'
    Plug 'ray-x/lsp_signature.nvim'
call plug#end()

" Lua local config
 lua require('config')

" gruvbox colorscheme
set termguicolors
colorscheme gruvbox

" Tree-sitter config
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }, indent = { enable = true } }

" Unix clipboard
set clipboard+=unnamedplus

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set noswapfile
set nowrap
set signcolumn=yes
set completeopt=menu,menuone,noselect
set scrolloff=8

" save undo trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

set number relativenumber

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Searching
set smartcase
set incsearch

" path
set path+=**

" Custom remaps
nnoremap Y y$
nnoremap n nzz
nnoremap N nzz
nnoremap J mzJ`z

" Leader mapping
nnoremap <space> <nop>
let mapleader = " "

nnoremap <leader>bn :bn<CR>
nnoremap tn :tabnew<CR>

let g:winresizer_start_key="<leader>r"

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
nnoremap gca :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>rg :Rg<CR>

nnoremap <leader>u :UndotreeShow<CR>

" QuickfixList navigation
nnoremap <leader>j :cnext<CR>zz
nnoremap <leader>k :cprev<CR>zz

nnoremap <C-q> :call ToggleQFList()<CR>

" Toggle QuickfixList
let g:aom_qf_open = 0

fun! ToggleQFList()
    if g:aom_qf_open == 1
        let g:aom_qf_open = 0
        cclose
    else
        let g:aom_qf_open = 1
        copen
    end
endfun

" Netrw config

let g:netrw_browse_split = 0
let g:netrw_winsize = 25
