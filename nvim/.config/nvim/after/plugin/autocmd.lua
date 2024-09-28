-- Organize imports or fix usings on save (for Go and C# using LSP)
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "go" then
            vim.lsp.buf.execute_command({
                command = "gopls.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) }
            })
        elseif ft == "cs" then
            vim.lsp.buf.code_action({
                only = { "source.fixAll.omnisharp" },
            })
        end
    end
})
