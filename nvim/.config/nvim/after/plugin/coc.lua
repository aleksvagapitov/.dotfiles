-- GoTo code navigation

-- autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
-- autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
-- autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
-- autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR


vim.cmd("autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')");
vim.cmd("autocmd BufWritePre *.cs :silent OmniSharpFixUsings");

local function on_ft(ft, cb)
    vim.api.nvim_create_autocmd('FileType', {
        group = init_lua_augroup,
        pattern = ft,
        callback = cb,
    })
end

on_ft('cs', function()
    vim.keymap.set('n', 'gd', ":OmniSharpGotoDefinition<CR>", { silent = true})
    vim.keymap.set("n", "gi", ":OmniSharpFindImplementations<CR>", {silent = true})
    vim.keymap.set("n", "gr", ":OmniSharpFindUsages<CR>", {silent = true})
end)

on_ft('vue', function()
    vim.keymap.set('n', '<leader>split', ":CocCommand volar.action.splitEditors<CR>", { silent = true})
end)

vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
