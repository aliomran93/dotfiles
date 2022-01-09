" Plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-startify'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/tmux-complete.vim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'gruvbox-community/gruvbox'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    Plug 'L3MON4D3/LuaSnip'
    Plug 'onsails/lspkind-nvim'
    Plug 'simrat39/symbols-outline.nvim'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'mbbill/undotree'
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
call plug#end()

" Lua local config
lua require('config')

" gruvbox colorscheme
set termguicolors
colorscheme gruvbox

" Tree-sitter config
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }, indent = { enable = true } }

" Unix clipboard


" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set nohlsearch
set noswapfile
set signcolumn=yes
set completeopt=menu,menuone,noselect

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

" path
set path+=**

" Wild menu
set wildmode=longest,list,full
set wildmenu

" Leader mapping
nnoremap <space> <nop>
let mapleader = " "

nnoremap <leader>bn :bn<CR>
nnoremap tn :tabnew<CR>

let g:winresizer_start_key="<leader>r"

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>rg :Rg<CR>

nnoremap <leader>u :UndotreeShow<CR>
