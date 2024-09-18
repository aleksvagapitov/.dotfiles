-- Go: Organize imports on save (using LSP)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.execute_command({
            command = "gopls.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) }
        })
    end
})

-- C#: Fix usings on save (using LSP)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cs",
    callback = function()
        vim.lsp.buf.code_action({
            only = { "source.fixAll.omnisharp" },
        })
    end
})
