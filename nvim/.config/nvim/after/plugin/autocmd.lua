vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "go" then
            vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
            })
        elseif ft == "cs" then
            vim.lsp.buf.code_action({
                context = { only = { "source.fixAll" } },
                apply = true,
            })
        elseif ft == "typescript" or ft == "javascript" or ft == "typescriptreact" or ft == "javascriptreact" then
            vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
            })
        elseif ft == "python" then
            vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
            })
        end
    end
})
