-- Function to apply key mappings based on file type
local function on_ft(ft, cb)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = ft,
        callback = cb,
    })
end

-- C# key mappings for OmniSharp using LSP
on_ft('cs', function()
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
end)

-- General key mappings for LSP navigation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
