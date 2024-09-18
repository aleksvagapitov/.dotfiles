require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",     -- Go
        "omnisharp", -- C#
        "pyright",   -- Python
        "ts_ls"      -- TypeScript (formerly tsserver)
    }
})

-- LSP configuration for Go, C#, Python, and TypeScript
local lspconfig = require("lspconfig")

-- Go
lspconfig.gopls.setup{}

-- C#
lspconfig.omnisharp.setup{}

-- Python
lspconfig.pyright.setup{}

-- TypeScript (using ts_ls)
lspconfig.ts_ls.setup{
    on_attach = function(client, bufnr)
        -- Optional additional TypeScript setup here
    end,
}
