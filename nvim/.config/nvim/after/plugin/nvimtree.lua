vim.keymap.set('n', '<C-m>', ':wincmd p<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- open current file in the file tree
vim.g.nvim_tree_respect_buf_cwd = 1

-- empty setup using defaults
require("nvim-tree").setup()
