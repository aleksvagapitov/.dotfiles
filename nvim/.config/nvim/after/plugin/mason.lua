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

-- Setup LSP for OmniSharp (C#)
lspconfig.omnisharp.setup{
    -- You can add additional configurations if needed, but mason.nvim handles the installation
    root_dir = lspconfig.util.root_pattern(".sln", ".csproj", ".git"),
}

-- Setup LSP for other languages
lspconfig.gopls.setup{}
lspconfig.pylsp.setup{}
lspconfig['ts_ls'].setup{}
