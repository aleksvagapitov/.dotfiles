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
local lspconfig = require('lspconfig')

lspconfig.pylsp.setup{
  on_attach = function(client, bufnr)
    -- Enable auto-formatting before saving
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })  -- Auto-format before saving
      end,
    })

    -- Enable formatting capabilities
    client.server_capabilities.documentFormattingProvider = true

    -- Command to find and run the appropriate test file
    vim.api.nvim_create_user_command('PyTest', function()
      local current_file = vim.api.nvim_buf_get_name(0)  -- Get the current file path

      local test_file
      if current_file:match("/test_.*%.py$") then
        -- If already in a test file, run pytest on the current file
        test_file = current_file
      else
        -- Convert regular file to its corresponding test file
        test_file = current_file:gsub("(.*/)([^/]+)%.py", "%1test_%2.py")
      end

      -- Run pytest in a terminal
      vim.cmd('terminal poetry run pytest ' .. test_file .. ' --color=yes')
    end, {desc = "Run pytest on the appropriate test file"})
  end,

  settings = {
    pylsp = {
      plugins = {
        pylint = { 
          enabled = true, 
          args = {
            "--disable=C0103",  -- Disable "module name doesn't conform to snake_case"
            "--disable=R0903",  -- Disable "too few public methods"
            "--disable=E1136",  -- Disable "missing type annotation"
            "--disable=C0114",  -- Disable "missing module docstring"
            "--disable=C0115",  -- Disable "missing class docstring"
            "--disable=C0116"   -- Disable "missing function docstring"
          }
        },

        -- Enable Black for auto-formatting
        black = { enabled = true },
      }
    }
  }
}lspconfig['ts_ls'].setup{}
