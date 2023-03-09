local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = 'Harpoon add file'})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, {desc = 'Harpoon Nav file 1'})
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, {desc = 'Harpoon Nav file 2'})
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, {desc = 'Harpoon Nav file 3'})
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, {desc = 'Harpoon Nav file 4'})
