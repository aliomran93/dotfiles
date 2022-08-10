local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

vim.g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.gruvbox_invert_selection = '0'
vim.opt.background = "dark"

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
})

hl("CursorLineNR", {
    bg = "None"
})

hl("Normal", {
    bg = "none"
})

hl("LineNr", {
    fg = "#5eacd3"
})

hl("netrwDir", {
    fg = "#5eacd3"
})

