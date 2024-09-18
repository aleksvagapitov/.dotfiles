require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",     -- Go
        "omnisharp", -- C#
        "pylsp",     -- Python
        "eslint"     -- TypeScript 
    }
})

-- LSP configuration for Go, C#, Python, and TypeScript
local lspconfig = require("lspconfig")

-- Go
lspconfig.gopls.setup{}

-- C#
lspconfig.omnisharp.setup{}

-- Python
lspconfig.pylsp.setup{}

-- TypeScript (using ts_ls)
lspconfig.eslint.setup{
    cmd = { "bun", "eslint", "--stdio" },
    settings = {
        workingDirectory = { mode = "auto" }
    }
}
