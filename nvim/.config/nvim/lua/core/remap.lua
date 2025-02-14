vim.g.mapleader = " "

-- Basic Remaps
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("n", "<leader>b", ":b#<CR>")

-- Disable Arrow Keys
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- Split Panes
vim.keymap.set("n", "<C-w>", ":wincmd k<cr>")
vim.keymap.set("n", "<C-s>", ":wincmd j<cr>")
vim.keymap.set("n", "<C-a>", ":wincmd h<cr>")
vim.keymap.set("n", "<C-d>", ":wincmd l<cr>")

-- Tabs
vim.keymap.set("n", "<C-h>", ":-tabnext<cr>")
vim.keymap.set("n", "<C-l>", ":+tabnext<cr>")
vim.keymap.set("n", "<C-t>", ":tabnew<cr>")
vim.keymap.set("n", "<C-c>", ":tabc<cr>")

-- Moving Line
vim.keymap.set("n", "<C-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<C-k>", ":m .-2<cr>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Replace all occurrences in the current file
vim.keymap.set('n', '<leader>rf', function()
    local old = vim.fn.input("Old string: ")
    local new = vim.fn.input("New string: ")
    vim.cmd(string.format("%%s/%s/%s/gc", old, new))
  end, { desc = "Replace all occurrences in current file" })
  
  -- Replace all occurrences across all files in the project
vim.keymap.set('n', '<leader>ra', function()
    local old = vim.fn.input("Old string: ")
    local new = vim.fn.input("New string: ")
    -- Use ripgrep to find all files containing the old string and load them into the argument list
    vim.cmd("args `rg --files-with-matches --no-ignore-vcs " .. old .. "`")
    -- Perform the substitution across all files in the argument list with confirmation
    vim.cmd("argdo %s/" .. old .. "/" .. new .. "/gc | update")
  end, { desc = "Replace all occurrences across all files with confirmation (respects .gitignore)" })
  
  
