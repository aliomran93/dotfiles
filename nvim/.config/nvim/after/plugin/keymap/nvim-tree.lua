local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>e", '<Cmd>NvimTreeFindFileToggle<CR>', {desc = 'Nvim Tree toggle'})
