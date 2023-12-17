return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
        servers = {
            intelephense = {
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 3000000
                        }
                    }
                }
            },
            eslint = {
                filetypes = {"liquid"},
            }
        },
    }
}

