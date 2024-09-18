local mason = require("mason")
local lspconfig = require("lspconfig")

-- Check if npm is installed
local function is_npm_installed()
    local handle = io.popen("npm --version")
    local result = handle:read("*a")
    handle:close()
    return result and result ~= ""
end

-- Mason setup
mason.setup()

-- Ensure LSP servers are installed
require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",     -- Go
        "omnisharp", -- C#
        "pylsp",     -- Python
    }
})

if is_npm_installed() then
    require("mason-lspconfig").setup({ ensure_installed = { "ts_ls" } })
end

-- LSP configuration for Go, C#, Python, and TypeScript
-- Go
lspconfig.gopls.setup{}

-- C#
lspconfig.omnisharp.setup{}

-- Python
lspconfig.pylsp.setup{}

-- TypeScript (using eslint)
if is_npm_installed() then
    lspconfig['ts_ls'].setup{}
else
    print("npm is not installed, skipping ts_ls setup")
end
