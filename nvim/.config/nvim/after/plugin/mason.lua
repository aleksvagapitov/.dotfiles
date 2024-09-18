local mason = require("mason")
local lspconfig = require("lspconfig")

-- Mason setup
mason.setup()

-- Ensure LSP servers are installed
require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",     -- Go
        "omnisharp", -- C#
        "pylsp",     -- Python
        "ts_ls"      -- Typescript
    }
})

lspconfig.gopls.setup{}
lspconfig.omnisharp.setup{}
lspconfig.pylsp.setup{}
lspconfig['ts_ls'].setup{}
